require "rails_helper"

RSpec.describe ByLinesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/by_lines").to route_to("by_lines#index")
    end

    it "routes to #show" do
      expect(get: "/by_lines/1").to route_to("by_lines#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/by_lines").to route_to("by_lines#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/by_lines/1").to route_to("by_lines#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/by_lines/1").to route_to("by_lines#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/by_lines/1").to route_to("by_lines#destroy", id: "1")
    end
  end
end
