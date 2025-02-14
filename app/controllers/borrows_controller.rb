class BorrowsController < ApplicationController
  include Authentication
  before_action :set_borrow, only: %i[ show edit update destroy ]

  # GET /borrows or /borrows.json
  def index
    @borrows = Borrow.all
  end

  # GET /borrows/1 or /borrows/1.json
  def show
  end

  # GET /borrows/new
  def new
    @borrow = Borrow.new
  end

  # GET /borrows/1/edit
  def edit
  end

  # POST /borrows or /borrows.json
  def create
    @book = Book.find(params[:book_id])
    if @book.available
      @borrow = Borrow.new(
        user_id: Current.user.id,
        book_id: @book.id,
        borrowed_at: Time.current,
        returned_at: nil,
        status: "borrowed",
        due_date: Time.current + 2.weeks
      )
      if @borrow.save
        @book.update(available: false)
        redirect_to books_path, notice: "Borrow was successfully created."
      else
        render :new, alert: "Borrow was not created."
      end
    else
      redirect_to books_path, alert: "Book is not available."
    end
  end

  def return_book
    @borrow = Borrow.find_by(id: params[:id])
    if @borrow
      @borrow.update(returned_at: Time.current, status: "returned")
      @book = @borrow.book
      @book.update(available: true)
      redirect_to borrows_path, notice: "#{@borrow.book.title} was successfully returned."
    else
      redirect_to borrows_path, alert: "Not Returned."
    end
  end

  # PATCH/PUT /borrows/1 or /borrows/1.json
  def update
    respond_to do |format|
      if @borrow.update(borrow_params)
        format.html { redirect_to @borrow, notice: "Borrow was successfully updated." }
        format.json { render :show, status: :ok, location: @borrow }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @borrow.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /borrows/1 or /borrows/1.json
  def destroy
    @borrow.destroy!

    respond_to do |format|
      format.html { redirect_to borrows_path, status: :see_other, notice: "Borrow was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrow
      @borrow = Borrow.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def borrow_params
      params.expect(borrow: [ :user_id, :book_id, :borrowed_at, :returned_at, :status ])
    end
end
