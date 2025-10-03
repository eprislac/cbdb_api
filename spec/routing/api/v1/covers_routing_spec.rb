require "rails_helper"

RSpec.describe Api::V1::CoversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/v1/covers").to route_to("covers#index")
    end

    it "routes to #show" do
      expect(get: "/api/v1/covers/1").to route_to("covers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/api/v1/covers").to route_to("covers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/api/v1/covers/1").to route_to("covers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/api/v1/covers/1").to route_to("covers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/api/v1/covers/1").to route_to("covers#destroy", id: "1")
    end
  end
end
