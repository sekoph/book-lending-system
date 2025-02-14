class HomeController < ApplicationController
  def index
      @borrowed_book = Borrow.joins(:book)
                            .where(user_id: Current.user.id, status: "borrowed")
                            .select("borrows.id, borrows.borrowed_at,borrows.due_date, borrows.status, books.title, books.author, books.isbn, books.available")
                            .page(params[:page])
                            .per(5)
  end

  def about
  end
end
