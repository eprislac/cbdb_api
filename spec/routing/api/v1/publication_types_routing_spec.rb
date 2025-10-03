require "rails_helper"

RSpec.describe Api::V1::PublicationTypesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/publication_types").to route_to("publication_types#index")
    end

    it "routes to #show" do
      expect(get: "/publication_types/1").to route_to("publication_types#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/publication_types").to route_to("publication_types#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/publication_types/1").to route_to("publication_types#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/publication_types/1").to route_to("publication_types#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/publication_types/1").to route_to("publication_types#destroy", id: "1")
    end
  end
end
