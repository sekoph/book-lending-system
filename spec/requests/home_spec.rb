require 'rails_helper'

RSpec.describe "Home", type: :request do
  let(:user) { create(:user) }

  describe "GET /index" do
    before do
      # Set up authentication
      post "/session", params: {
        email_address: user.email_address,
        password: user.password
      }
      get "/"
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end
end
