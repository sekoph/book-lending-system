class AdminController < ApplicationController
  include Authentication
  before_action :set_book, only: %i[ show edit update destroy ]
  allow_unauthenticated_access only: %i[index edit new show about borrowed_books]
  layout "admin_dashboard"
  def index
    @books = Book.page(params[:page]).per(5)
  end

  def about
  end

  def borrowed_books
    @borrowed_book = Borrow.joins(:book)
                            .where(status: "borrowed")
                            .select("borrows.id, borrows.borrowed_at,borrows.due_date, borrows.status, books.title, books.author, books.isbn, books.available")
                            .page(params[:page])
                            .per(5)
  end

  # GET /books/1 or /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books or /books.json
  def create
    @book = Book.new(book_params)

    respond_to do |format|
      if @book.save
        format.html { redirect_to admins_path, notice: "Book was successfully created." }
        # format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1 or /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: "Book was successfully updated." }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1 or /books/1.json
  def destroy
    @book.destroy!

    respond_to do |format|
      format.html { redirect_to books_path, status: :see_other, notice: "Book was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def book_params
      params.expect(book: [ :title, :author, :isbn, :available ])
    end
end
