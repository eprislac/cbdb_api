require 'rails_helper'

RSpec.describe "/users", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "John Doe", email: "john@example.com" }
  }

  let(:invalid_attributes) {
    { name: "", email: "" }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    let!(:user) { create(:user, valid_attributes) }

    it "renders a successful response" do
      get api_v1_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  # describe "GET /show" do
  #   let!(:user) { create(:user, valid_attributes) }

  #   it "renders a successful response" do
  #     get api_v1_user_url(user), as: :json
  #     expect(response).to be_successful
  #   end
  # end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new User" do
        expect {
          post api_v1_users_url,
               params: { user: valid_attributes }, headers: valid_headers, as: :json
        }.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post api_v1_users_url,
             params: { user: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new User" do
        expect {
          post api_v1_users_url,
               params: { user: invalid_attributes }, as: :json
        }.to change(User, :count).by(0)
      end

      it "renders a JSON response with errors for the new user" do
        post api_v1_users_url,
             params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let!(:user) { create(:user, valid_attributes) }
      let(:new_attributes) {
        { name: "Jane Doe", email: "jane@example.com" }
      }

      it "updates the requested user" do
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        user.reload
        expect(user.name).to eq("Jane Doe")
        expect(user.email).to eq("jane@example.com")
      end

      it "renders a JSON response with the user" do
        patch api_v1_user_url(user),
              params: { user: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      let!(:user) { create(:user, valid_attributes) }

      it "renders a JSON response with errors for the user" do
        patch api_v1_user_url(user),
              params: { user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:user) { create(:user, valid_attributes) }
    it "destroys the requested user" do
      expect {
        delete api_v1_user_url(user), headers: valid_headers, as: :json
      }.to change(User, :count).by(-1)
    end
  end
end
