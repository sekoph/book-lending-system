require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/borrows", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Borrow. As you add validations to Borrow, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Borrow.create! valid_attributes
      get borrows_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      borrow = Borrow.create! valid_attributes
      get borrow_url(borrow)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_borrow_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      borrow = Borrow.create! valid_attributes
      get edit_borrow_url(borrow)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Borrow" do
        expect {
          post borrows_url, params: { borrow: valid_attributes }
        }.to change(Borrow, :count).by(1)
      end

      it "redirects to the created borrow" do
        post borrows_url, params: { borrow: valid_attributes }
        expect(response).to redirect_to(borrow_url(Borrow.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Borrow" do
        expect {
          post borrows_url, params: { borrow: invalid_attributes }
        }.to change(Borrow, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post borrows_url, params: { borrow: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested borrow" do
        borrow = Borrow.create! valid_attributes
        patch borrow_url(borrow), params: { borrow: new_attributes }
        borrow.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the borrow" do
        borrow = Borrow.create! valid_attributes
        patch borrow_url(borrow), params: { borrow: new_attributes }
        borrow.reload
        expect(response).to redirect_to(borrow_url(borrow))
      end
    end

    context "with invalid parameters" do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        borrow = Borrow.create! valid_attributes
        patch borrow_url(borrow), params: { borrow: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested borrow" do
      borrow = Borrow.create! valid_attributes
      expect {
        delete borrow_url(borrow)
      }.to change(Borrow, :count).by(-1)
    end

    it "redirects to the borrows list" do
      borrow = Borrow.create! valid_attributes
      delete borrow_url(borrow)
      expect(response).to redirect_to(borrows_url)
    end
  end
end
