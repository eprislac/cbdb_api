require "rails_helper"

RSpec.describe CoversController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/covers").to route_to("covers#index")
    end

    it "routes to #show" do
      expect(get: "/covers/1").to route_to("covers#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/covers").to route_to("covers#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/covers/1").to route_to("covers#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/covers/1").to route_to("covers#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/covers/1").to route_to("covers#destroy", id: "1")
    end
  end
end
