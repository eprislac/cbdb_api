require "rails_helper"


require 'rails_helper'

RSpec.describe "API V1 Collection Items Routes", type: :routing do
  let(:email) { "user@example.com" }
  let(:collection_id) { "123" }
  let(:item_id) { "456" }

  describe "GET routes" do
    it "routes to index action" do
      expect(get: "/api/v1/#{email}/collection/#{collection_id}/items").to route_to(
        controller: "api/v1/collection_items",
        action: "index",
        email: email,
        collection_id: collection_id,
        format: 'json'
      )
    end

    it "routes to show action" do
      expect(get: "/api/v1/#{email}/collection/#{collection_id}/items/#{item_id}").to route_to(
        controller: "api/v1/collection_items",
        action: "show",
        email: email,
        collection_id: collection_id,
        id: item_id,
        format: 'json'
      )
    end
  end

  describe "POST route" do
    it "routes to create action" do
      expect(post: "/api/v1/#{email}/collection/#{collection_id}/items").to route_to(
        controller: "api/v1/collection_items",
        action: "create",
        email: email,
        collection_id: collection_id,
        format: 'json'
      )
    end
  end

  describe "PUT route" do
    it "routes to update action" do
      expect(put: "/api/v1/#{email}/collection/#{collection_id}/items/#{item_id}").to route_to(
        controller: "api/v1/collection_items",
        action: "update",
        email: email,
        collection_id: collection_id,
        id: item_id,
        format: 'json'
      )
    end
  end

  describe "DELETE route" do
    it "routes to destroy action" do
      expect(delete: "/api/v1/#{email}/collection/#{collection_id}/items/#{item_id}").to route_to(
        controller: "api/v1/collection_items",
        action: "destroy",
        email: email,
        collection_id: collection_id,
        id: item_id,
        format: 'json'
      )
    end
  end
end
