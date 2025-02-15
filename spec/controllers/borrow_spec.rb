require 'rails_helper'

RSpec.describe "borrows", type: :request do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  describe "GET /borrows" do
    it "renders a successful response" do
      get borrows_path
      expect(response).to be_successful
    end
  end
end
