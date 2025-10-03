require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: :api_v1_user_collections).to route_to("api/v1/collections#index")
    end

    it "routes to #show" do
      expect(get: :api_v1_user_collection).to route_to("api/v1/collections#show", id: "1")
    end


    it "routes to #create" do
      expect(post: :api_v1_create_user_collection).to route_to("api/v1/collections#create")
    end

    it "routes to #update via PUT" do
      expect(put: :api_v1_update_user_collection).to route_to("api/v1/collections#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: :api_v1_update_user_collection).to route_to("api/v1/collections#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: :api_v1_delete_user_collection).to route_to("api/v1/collections#destroy", id: "1")
    end
  end
end
