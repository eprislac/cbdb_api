require 'rails_helper'

RSpec.describe "/creators", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Creator. As you add validations to Creator, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { last_name: 'Lee', first_name: 'Stan' }
  }

  let(:invalid_attributes) {
    { last_name: '', first_name: '' }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CreatorsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Creator.create! valid_attributes
      get api_v1_creators_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      creator = Creator.create! valid_attributes
      get api_v1_creator_url(creator), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Creator" do
        expect {
          post api_v1_creators_url,
               params: { creator: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Creator, :count).by(1)
      end

      it "renders a JSON response with the new creator" do
        post api_v1_creators_url,
             params: { creator: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Creator" do
        expect {
          post api_v1_creators_url,
               params: { creator: invalid_attributes }, as: :json
        }.to change(Creator, :count).by(0)
      end

      it "renders a JSON response with errors for the new creator" do
        post api_v1_creators_url,
             params: { creator: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { first_name: "Jack", last_name: "Kirby" }
      }

      it "updates the requested creator" do
        creator = Creator.create! valid_attributes
        patch api_v1_creator_url(creator),
              params: { creator: new_attributes }, headers: valid_headers, as: :json
        creator.reload
        expect(creator.first_name).to eq("Jack")
        expect(creator.last_name).to eq("Kirby")
      end

      it "renders a JSON response with the creator" do
        creator = Creator.create! valid_attributes
        patch api_v1_creator_url(creator),
              params: { creator: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the creator" do
        creator = Creator.create! valid_attributes
        patch api_v1_creator_url(creator),
              params: { creator: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested creator" do
      creator = Creator.create! valid_attributes
      expect {
        delete api_v1_creator_url(creator), headers: valid_headers, as: :json
      }.to change(Creator, :count).by(-1)
    end
  end
end
