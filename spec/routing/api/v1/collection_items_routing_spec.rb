require "rails_helper"


require 'rails_helper'

RSpec.describe "API V1 Collection Items Routes", type: :routing do
  let(:user) { create(:user, email: Faker::Internet.email) }
  let(:collection) { create(:collection, user: user) }
  let(:condition) { create(:condition, name: "Near Mint") }
  let(:publication_type) { create(:publication_type, name: "Comic Book") }
  let(:publisher) { create(:publisher, name: "Marvel Comics") }
  let(:publication) { create(:publication, title: "Amazing Spider-Man", volume: 1, publication_type:, publisher:) }
  let(:issue) { create(:issue, number: 1, publication:) }
  let(:cover) { create(:cover, variant: "Regular", issue:) }
  let(:copy) { create(:copy, issue:, collection:, condition:, cover:) }
  let(:email) { user.email }
  let(:collection_id) { collection.id }
  let(:item_id) { copy.id }

  describe "GET routes" do
    it "routes to index action" do
      expect(get: api_v1_collection_items_path(email: email, collection_id: collection_id))
        .to route_to(
          controller: "api/v1/collection_items",
          action: "index",
          email: email,
          collection_id: collection_id,
          format: "json"
        )
    end

    it "routes to show action" do
      expect(get: api_v1_collection_item_path(
          email: email, collection_id: collection_id, id: item_id
        )
      ).to route_to(
        controller: "api/v1/collection_items",
        action: "show",
        email: email,
        collection_id: collection_id,
        id: item_id,
        format: "json"
      )
    end
  end

  describe "POST route" do
    it "routes to create action" do
      expect(post: api_v1_create_collection_item_path(email: email, collection_id: collection_id))
        .to route_to(
          controller: "api/v1/collection_items",
          action: "create",
          email: email,
          collection_id: collection_id,
          format: "json"
        )
    end
  end

  describe "PUT route" do
    it "routes to update action" do
      expect(put: api_v1_update_collection_item_path(email: email, collection_id: collection_id, id: item_id))
        .to route_to(
          controller: "api/v1/collection_items",
          action: "update",
          email: email,
          collection_id: collection_id,
          id: item_id,
          format: "json"
        )
    end
  end

  describe "DELETE route" do
    it "routes to destroy action" do
      expect(delete: api_v1_delete_collection_item_path(email: email, collection_id: collection_id, id: item_id))
        .to route_to(
          controller: "api/v1/collection_items",
          action: "destroy",
          email: email,
          collection_id: collection_id,
          id: item_id,
          format: "json"
        )
    end
  end
end
