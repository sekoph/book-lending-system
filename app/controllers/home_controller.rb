class HomeController < ApplicationController
  def index
    @borrowed_book = Book.joins(:borrows).where(borrows: { user_id: Current.user.id }).select("books.*, borrows.borrowed_at, borrows.returned_at, borrows.status").page(params[:page]).per(5)
  end

  def about
  end
end
