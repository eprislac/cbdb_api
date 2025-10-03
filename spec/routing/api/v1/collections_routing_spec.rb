require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:api_v1_user_collections).to route_to("api/v1/collections#index", email: 'thing@ma.bob')
    end

    it "routes to #show" do
      expect(:api_v1_user_collection).to route_to("api/v1/collections#show", email: 'thing@ma.bob', id: "1")
    end


    it "routes to #create" do
      expect(:api_v1_create_user_collection).to route_to("api/v1/collections#create", email: 'thing@ma.bob')
    end

    it "routes to #update via PUT" do
      expect(:api_v1_update_user_collection).to route_to("api/v1/collections#update", email: 'thing@ma.bob', id: "1")
    end

    it "routes to #update via PATCH" do
      expect(:api_v1_update_user_collection).to route_to("api/v1/collections#update", email: 'thing@ma.bob', id: "1")
    end

    it "routes to #destroy" do
      expect(:api_v1_delete_user_collection).to route_to("api/v1/collections#destroy", email: 'thing@ma.bob', id: "1")
    end
  end
end
