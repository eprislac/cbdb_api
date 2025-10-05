require 'rails_helper'

RSpec.describe "/issues", type: :request do
  # This should return the minimal set of attributes required to create a valid
  # Issue. As you add validations to Issue, be sure to
  # adjust the attributes here as well.
  let!(:publication_type) { create(:publication_type, name: "Comic Book") }
  let!(:publisher) { create(:publisher, name: "Marvel Comics") }
  let!(:publication) { create(:publication, title: "Amazing Spider-Man", publication_type_id: publication_type.id, publisher_id: publisher.id) }

  let(:valid_attributes) {
    { number: 1, publication_id: publication.id }
  }

  let(:invalid_attributes) {
    { number: 1, publication_id: nil }
  }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # IssuesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  let(:issue) { create(:issue, valid_attributes) }

  describe "GET /index" do
    let!(:issue) { create(:issue, valid_attributes) }

    it "renders a successful response" do
      get api_v1_issues_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    let!(:issue) { create(:issue, valid_attributes) }

    it "renders a successful response" do
      get api_v1_issue_url(issue), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Issue" do
        expect {
          post api_v1_issues_url,
               params: { issue: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Issue, :count).by(1)
      end

      it "renders a JSON response with the new issue" do
        post api_v1_issues_url,
             params: { issue: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Issue" do
        expect {
          post api_v1_issues_url,
               params: { issue: invalid_attributes }, as: :json
        }.to change(Issue, :count).by(0)
      end

      it "renders a JSON response with errors for the new issue" do
        post api_v1_issues_url,
             params: { issue: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    let!(:issue) { create(:issue, valid_attributes) }

    context "with valid parameters" do
      let(:new_attributes) {
        { number: 2 }
      }

      it "updates the requested issue" do
        patch api_v1_issue_url(issue),
              params: { issue: new_attributes }, headers: valid_headers, as: :json
        issue.reload
        expect(issue.number).to eq(2)
      end

      it "renders a JSON response with the issue" do
        patch api_v1_issue_url(issue),
              params: { issue: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the issue" do
        patch api_v1_issue_url(issue),
              params: { issue: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:issue) { create(:issue, valid_attributes) }

    it "destroys the requested issue" do
      expect {
        delete api_v1_issue_url(issue), headers: valid_headers, as: :json
      }.to change(Issue, :count).by(-1)
    end
  end
end
