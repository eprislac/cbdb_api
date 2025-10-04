require 'rails_helper'

RSpec.describe "/publications", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Publication. As you add validations to Publication, be sure to
  # adjust the attributes here as well.
  let(:publication_type) { create(:publication_type, name: "Comic Book") }
  let(:publisher) { create(:publisher, name: "Marvel Comics") }

  let(:valid_attributes) {
    { title: "Amazing Spider-Man", publication_type_id: publication_type.id, publisher_id: publisher.id }
  }

  let(:invalid_attributes) {
    { title: "Invalid Publication", publication_type_id: nil, publisher_id: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # PublicationsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    let!(:publication) { create(:publication, valid_attributes) }
    it "renders a successful response" do
      Publication.create! valid_attributes
      get api_v1_publications_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:publication) { create(:publication, valid_attributes) }
    it "renders a successful response" do
      get api_v1_publication_url(publication), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Publication" do
        expect {
          post api_v1_publications_url,
               params: { publication: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Publication, :count).by(1)
      end

      it "renders a JSON response with the new publication" do
        post api_v1_publications_url,
             params: { publication: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Publication" do
        expect {
          post api_v1_publications_url,
               params: { publication: invalid_attributes }, as: :json
        }.to change(Publication, :count).by(0)
      end

      it "renders a JSON response with errors for the new publication" do
        post api_v1_publications_url,
             params: { publication: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let!(:publication) { create(:publication, valid_attributes) }
      let(:new_attributes) {
        { title: "The Incredible Hulk" }
      }

      it "updates the requested publication" do
        patch api_v1_publication_url(publication),
              params: { publication: new_attributes }, headers: valid_headers, as: :json
        publication.reload
        expect(publication.title).to eq("The Incredible Hulk")
      end

      it "renders a JSON response with the publication" do
        patch api_v1_publication_url(publication),
              params: { publication: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      let!(:publication) { create(:publication, valid_attributes) }
      it "renders a JSON response with errors for the publication" do
        patch api_v1_publication_url(publication),
              params: { publication: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:publication) { create(:publication, valid_attributes) }
    it "destroys the requested publication" do
      expect {
        delete api_v1_publication_url(publication), headers: valid_headers, as: :json
      }.to change(Publication, :count).by(-1)
    end
  end
end
