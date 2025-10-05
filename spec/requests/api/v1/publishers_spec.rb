require 'rails_helper'

RSpec.describe "/publishers", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Publisher. As you add validations to Publisher, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    { name: "Marvel Comics" }
  }

  let(:invalid_attributes) {
    { name: "" }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PublishersController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    let!(:publisher) { create(:publisher, valid_attributes) }
    it "renders a successful response" do
      get api_v1_publishers_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:publisher) { create(:publisher, valid_attributes) }
    it "renders a successful response" do
      get api_v1_publisher_url(publisher), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Publisher" do
        expect {
          post api_v1_publishers_url,
               params: { publisher: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Publisher, :count).by(1)
      end

      it "renders a JSON response with the new publisher" do
        post api_v1_publishers_url,
             params: { publisher: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Publisher" do
        expect {
          post api_v1_publishers_url,
               params: { publisher: invalid_attributes }, as: :json
        }.to change(Publisher, :count).by(0)
      end

      it "renders a JSON response with errors for the new publisher" do
        post api_v1_publishers_url,
             params: { publisher: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "DC Comics" }
      }
      let!(:publisher) { create(:publisher, valid_attributes) }

      it "updates the requested publisher" do
        patch api_v1_publisher_url(publisher),
              params: { publisher: new_attributes }, headers: valid_headers, as: :json
        publisher.reload
        expect(publisher.name).to eq("DC Comics")
      end

      it "renders a JSON response with the publisher" do
        patch api_v1_publisher_url(publisher),
              params: { publisher: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      let!(:publisher) { create(:publisher, valid_attributes) }
      it "renders a JSON response with errors for the publisher" do
        patch api_v1_publisher_url(publisher),
              params: { publisher: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:publisher) { create(:publisher, valid_attributes) }
    it "destroys the requested publisher" do
      expect {
        delete api_v1_publisher_url(publisher), headers: valid_headers, as: :json
      }.to change(Publisher, :count).by(-1)
    end
  end
end
