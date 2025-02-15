require 'rails_helper'

RSpec.describe HomeController, type: :controller do
  let(:user) { create(:user) }

  context 'when user is authenticated' do
    before do
      @controller = SessionsController.new
      post :create, params: {
        email_address: user.email_address,
        password: user.password
      }
      @controller = HomeController.new
    end

    describe 'GET #about' do
      it 'returns successful response' do
        get :about
        expect(response).to have_http_status(:success)
      end
    end

    describe "GET /index" do
        it "returns http success" do
          expect(response).to have_http_status(:success)
        end
      end
  end
end
