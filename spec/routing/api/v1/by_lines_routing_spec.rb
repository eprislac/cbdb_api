require "rails_helper"

RSpec.describe Api::V1::ByLinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get "/api/v1/by_lines").to route_to(controller: "api/v1/by_lines", action: "index", format: 'json')
    end

    it "routes to #show" do
      expect(get "/api/v1/by_lines/1")
        .to route_to(controller: "api/v1/by_lines", action: "show", id: "1", format: 'json')
    end


    it "routes to #create" do
      expect(post "/api/v1/by_lines/", params: { name: 'Writer' })
        .to route_to(controller: "api/v1/by_lines", action: "create", name: 'Writer', format: 'json')
    end

    it "routes to #update via PUT" do
      expect(patch "/api/v1/by_lines/1")
        .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
    end

    it "routes to #update via PATCH" do
      expect(patch "/api/v1/by_lines/1")
        .to route_to(controller: "api/v1/by_lines", action: "update", id: "1", by_line: { name: 'Writer' }, format: 'json')
    end

    it "routes to #destroy" do
      expect(delete "/api/v1/by_lines/1")
        .to route_to(controller: "api/v1/by_lines", action: "destroy", id: "1", format: 'json')
    end
  end
end
