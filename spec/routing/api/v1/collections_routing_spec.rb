require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get api_v1_user_collections_path(email: 'thing@ma.bob'))
        .to route_to(controller: "api/v1/collections", action: "index", email: 'thing@ma.bob')
    end

    it "routes to #show" do
      expect(get api_v1_user_collection_path(email: 'thing@ma.bob', id: '1'))
        .to route_to(controller: "api/v1/collections", action: "show", email: 'thing@ma.bob', id: '1')
    end


    it "routes to #create" do
      expect(post api_v1_create_user_collection_path(email: 'thing@ma.bob'))
        .to route_to(controller: "api/v1/collections", action: "create", email: 'thing@ma.bob')
    end

    it "routes to #update via PUT" do
      expect(patch api_v1_update_user_collection_path(email: 'thing@ma.bob', id: '1'))
        .to route_to(controller: "api/v1/collections", action: "update", email: 'thing@ma.bob', id: '1')
    end

    it "routes to #update via PATCH" do
      expect(put api_v1_update_user_collection_path(email: 'thing@ma.bob', id: '1'))
        .to route_to(controller: "api/v1/collections", action: "update", email: 'thing@ma.bob', id: '1')
    end

    it "routes to #destroy" do
      expect(delete api_v1_delete_user_collection_path(email: 'thing@ma.bob', id: '1'))
        .to route_to(controller: "api/v1/collections", action: "destroy", email: 'thing@ma.bob', id: '1')
    end
  end
end
