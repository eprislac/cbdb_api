require "rails_helper"

RSpec.describe Api::V1::CreatorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/creators")
        .to route_to("api/v1/creators#index", format: "json")
    end

    it "routes to #show" do
      expect(get: "/api/v1/creators/1")
        .to route_to("api/v1/creators#show", id: "1", format: "json")
    end


    it "routes to #create" do
      expect(post: "/api/v1/creators")
        .to route_to("api/v1/creators#create", format: "json")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/creators/1")
        .to route_to("api/v1/creators#update", id: "1", format: "json")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/creators/1")
        .to route_to("api/v1/creators#update", id: "1", format: "json")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/creators/1")
        .to route_to("api/v1/creators#destroy", id: "1", format: "json")
    end
  end
end
