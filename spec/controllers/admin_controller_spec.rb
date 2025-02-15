require 'rails_helper'

RSpec.describe AdminController, type: :controller do
  let!(:books) { create_list(:book, 7) }
  let(:valid_attributes) { { title: "Test Book", author: "Test Author", isbn: "123-456-789", available: true } }
  let(:invalid_attributes) { { title: nil, author: nil } }
  let(:book) { create(:book) }

  describe 'GET #index' do
    it 'returns successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns paginated @books' do
      get :index
      expect(assigns(:books).count).to eq(5)
      expect(assigns(:books)).to eq(Book.page(1).per(5))
    end

    it 'renders with admin_dashboard layout' do
      get :index
      expect(response).to render_template('layouts/admin_dashboard')
    end
  end

  describe 'GET #borrowed_books' do
    let!(:borrow) { create(:borrow, status: 'borrowed') }

    it 'returns successful response' do
      get :borrowed_books
      expect(response).to have_http_status(:success)
    end

    it 'assigns paginated @borrowed_book' do
      get :borrowed_books
      expect(assigns(:borrowed_book)).to be_present
    end
  end

  describe 'GET #show' do
    it 'returns successful response' do
      get :show, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #new' do
    it 'returns successful response' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #edit' do
    it 'returns successful response' do
      get :edit, params: { id: book.id }
      expect(response).to have_http_status(:success)
    end
  end
end
