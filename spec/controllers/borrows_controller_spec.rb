require 'rails_helper'

RSpec.describe BorrowsController, type: :controller do
  let(:user) { create(:user) }
  let!(:book) { create(:book) }
  let!(:borrow) { create(:borrow, user: user, book: book) }

  before do
    @controller = SessionsController.new
        post :create, params: {
          email_address: user.email_address,
          password: user.password
        }
  end


  describe 'POST #create' do
    let(:book) { create(:book) }
    let(:user) { create(:user) }
    before do
      @controller = SessionsController.new
          post :create, params: {
            email_address: user.email_address,
            password: user.password
          }
      @controller = BorrowsController.new
    end

    it 'creates a new borrow record' do
      expect {
        post :create, params: { book_id: book.id }
      }.to change(Borrow, :count).by(1)
    end
  end

  describe 'PUT #return_book' do
    let(:borrow) { create(:borrow) }
    before do
      @controller = SessionsController.new
          post :create, params: {
            email_address: user.email_address,
            password: user.password
          }
      @controller = BorrowsController.new
    end

    it 'marks the book as returned' do
      put :return_book, params: { id: borrow.id }
      expect(borrow.reload.returned_at).to be_present
    end
  end
end
