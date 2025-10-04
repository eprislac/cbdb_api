require 'rails_helper'

RSpec.describe "api/v1/by_lines", type: :request do
  let!(:valid_attributes) { { name: 'Writer' } }

  let!(:invalid_attributes) { { name: '' } }


  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # ByLinesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let!(:valid_headers) {
    { "ACCEPT" => "application/json" }
  }

  let(:by_line) { create(:by_line, valid_attributes) }

  describe "GET /index" do
    it "renders a successful response" do
      get api_v1_by_lines_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get api_v1_by_line_url(by_line), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ByLine" do
        expect {
          post api_v1_by_lines_url,
               params: { by_line: valid_attributes }, headers: valid_headers, as: :json
        }.to change(ByLine, :count).by(1)
      end

      it "renders a JSON response with the new by_line" do
        post api_v1_by_lines_url,
             params: { by_line: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ByLine" do
        expect {
          post api_v1_by_lines_url,
               params: { by_line: invalid_attributes }, as: :json
        }.to change(ByLine, :count).by(0)
      end

      it "renders a JSON response with errors for the new by_line" do
        post api_v1_by_lines_url,
             params: { by_line: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        { name: "Artist" }
      }

      let!(:by_line) { create(:by_line, name: 'Editor') }
      it "updates the requested by_line" do
        patch api_v1_by_line_url(by_line),
              params: { by_line: new_attributes }, headers: valid_headers, as: :json
        by_line.reload
        expect(by_line.name).to eq("Artist")
      end

      it "renders a JSON response with the by_line" do
        patch api_v1_by_line_url(by_line),
              params: { by_line: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      let!(:by_line) { create(:by_line, name: 'Editor') }
      it "renders a JSON response with errors for the by_line" do
        patch api_v1_by_line_url(by_line),
              params: { by_line: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_content)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:by_line) { create(:by_line, name: 'Editor') }
    it "destroys the requested by_line" do
      expect {
        delete api_v1_by_line_url(by_line), headers: valid_headers, as: :json
      }.to change(ByLine.all, :count).by(-1)
    end
  end
end
