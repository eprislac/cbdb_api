require "rails_helper"

RSpec.describe Api::V1::CollectionItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: api_v1_collection_items_path(collection_id: '1'))
        .to route_to("api/v1/collection_items_items#index", collection_id: '1')
    end

    it "routes to #show" do
      expect(get: api_v1_collection_item_path(collection_id: '1', id: '1'))
        .to route_to("api/v1/collections_items#show", id: '1', collection_id: '1')
    end


    it "routes to #create" do
      expect(post: api_v1_create_collection_item_path(collection_id: '1'))
        .to route_to("api/v1/collections_items#create", collection_id: '1')
    end

    it "routes to #update via PUT" do
      expect(put: api_v1_update_collection_item_path(id: '1', collection_id: '1'))
        .to route_to("api/v1/collections_items#update", id: '1', collection_id: '1')
    end

    it "routes to #update via PATCH" do
      expect(patch: api_v1_update_collection_item_path(id: '1', collection_id: '1'))
        .to route_to("api/v1/collections_items#update", id: '1', collection_id: '1')
    end

    it "routes to #destroy" do
      expect(delete: api_v1_delete_collection_item_path(id: '1', collection_id: '1'))
        .to route_to("api/v1/collections_items#destroy", id: '1', collection_id: '1')
    end
  end
end
