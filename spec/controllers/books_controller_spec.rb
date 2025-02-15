require 'rails_helper'

RSpec.describe BooksController, type: :controller do
  let(:user) { create(:user) }
  let!(:book) { create(:book) }
  let(:invalid_attributes) { { title: nil, author: nil } }
  let(:valid_attributes) { { title: "Test Book", author: "Test Author", isbn: "123-456-789", available: true } }


  describe 'GET #index' do
    context 'when user is authenticated' do
      before do
        # First authenticate through sessions controller
        @controller = SessionsController.new
        post :create, params: {
          email_address: user.email_address,
          password: user.password
        }

        # Then switch back to books controller for the test
        @controller = BooksController.new
        get :index
      end

      it 'returns a successful response' do
        expect(response).to have_http_status(:success)
      end

      it 'assigns @books' do
        expect(assigns(:books)).to include(book)
      end
    end
  end

  describe 'POST #create' do
        context 'with valid parameters' do
          it 'creates a new Book' do
            expect {
              post :create, params: { book: valid_attributes }
            }.to change(Book, :count).by(1)
          end

          it 'redirects to admin index' do
            post :create, params: { book: valid_attributes }
            expect(response).to redirect_to(admin_index_path)
          end
        end

        context 'with invalid parameters' do
          it 'does not create a new Book' do
            expect {
              post :create, params: { book: invalid_attributes }
            }.not_to change(Book, :count)
          end

          it 'renders new template' do
            post :create, params: { book: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
    end

    describe 'PATCH #update' do
      context 'when user is authenticated' do
        context 'with valid parameters' do
          let(:new_attributes) { { title: "Updated Title" } }

          it 'updates the book' do
            patch :update, params: { id: book.id, book: new_attributes }
            book.reload
            expect(book.title).to eq("Updated Title")
          end

          it 'redirects to admin index' do
            patch :update, params: { id: book.id, book: new_attributes }
            expect(response).to redirect_to(admin_index_path)
          end
        end

        context 'with invalid parameters' do
          it 'renders edit template' do
            patch :update, params: { id: book.id, book: invalid_attributes }
            expect(response).to have_http_status(:unprocessable_entity)
          end
        end
      end
    end
end
