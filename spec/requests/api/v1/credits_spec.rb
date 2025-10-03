require 'rails_helper'

RSpec.describe "/credits", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Credit. As you add validations to Credit, be sure to
  # adjust the attributes here as well.
  let(:by_line) { create!(:by_line, name: "Writer") }
  let(:creator) { create!(:creator, last_name: "Lee", first_name: "Stan") }
  let(:publication_type) { create!(:publication_type, name: "Comic Book") }
  let(:publisher) { create!(:publisher, name: "Marvel Comics") }
  let(:publication) { create!(:publilcation, title: "Amazing Spider-Man", publication_type_id: publication_type.id, publisher_id: publisher.id) }
  let(:issue) { create!(:issue, number: 1, publication_id: publication.id) }

  let(:valid_attributes) {
    { by_line_id: by_line.id, creator_id: creator.id, issue_id: issue.id }
  }

  let(:invalid_attributes) {
    { by_line_id: nil, creator_id: nil, issue_id: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # CreditsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      Credit.create! valid_attributes
      get credits_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      credit = Credit.create! valid_attributes
      get credit_url(credit), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Credit" do
        expect {
          post credits_url,
               params: { credit: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Credit, :count).by(1)
      end

      it "renders a JSON response with the new credit" do
        post credits_url,
             params: { credit: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Credit" do
        expect {
          post credits_url,
               params: { credit: invalid_attributes }, as: :json
        }.to change(Credit, :count).by(0)
      end

      it "renders a JSON response with errors for the new credit" do
        post credits_url,
             params: { credit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_by_line) { ByLine.create!(name: "Artist") }
      let(:new_attributes) {
        { by_line_id: new_by_line.id }
      }

      it "updates the requested credit" do
        credit = Credit.create! valid_attributes
        patch credit_url(credit),
              params: { credit: new_attributes }, headers: valid_headers, as: :json
        credit.reload
        expect(credit.by_line_id).to eq(new_by_line.id)
      end

      it "renders a JSON response with the credit" do
        credit = Credit.create! valid_attributes
        patch credit_url(credit),
              params: { credit: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the credit" do
        credit = Credit.create! valid_attributes
        patch credit_url(credit),
              params: { credit: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested credit" do
      credit = Credit.create! valid_attributes
      expect {
        delete credit_url(credit), headers: valid_headers, as: :json
      }.to change(Credit, :count).by(-1)
    end
  end
end
