require "rails_helper"


require 'rails_helper'

RSpec.describe "API V1 Collection Items Routes", type: :routing do
  let(:user) { create(:user, email: Faker::Internet.email) }
  let(:collection) { create(:collection, user: user, name: 'New Collection') }
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

  let(:app_secret) { ENV['APP_SECRET'] }
  let(:key) { [ app_secret ].pack('H*') } # Decode hex to binary
  let(:nonce) { RbNaCl::Random.random_bytes(RbNaCl::SecretBox.nonce_bytes) }
  let(:message) { user.email }
  let(:box) { RbNaCl::SecretBox.new(key) }
  let(:ciphertext) { box.encrypt(nonce, message) }
  let!(:encrypted_email) { "#{Base64.encode64(nonce).strip}:#{Base64.encode64(ciphertext).strip}" }
  let(:cipher_id) { box.encrypt(nonce, collection_id.to_s) }
  let!(:encrypted_id) { "#{Base64.encode64(nonce).strip}:#{Base64.encode64(cipher_id).strip}" }



  describe "GET routes" do
    it "routes to index action" do
      expect(get: api_v1_collection_items_path(email: encrypted_email, collection_id: encrypted_id))
        .to route_to(
          controller: "api/v1/collection_items",
          action: "index",
          email: encrypted_email,
          collection_id: encrypted_id
        )
    end

    it "routes to show action" do
      expect(get: api_v1_collection_item_path(
          email: encrypted_email, collection_id: encrypted_id, id: item_id.to_s
        )
      ).to route_to(
        controller: "api/v1/collection_items",
        action: "show",
        email: encrypted_email,
        collection_id: encrypted_id,
          id: item_id.to_s
      )
    end
  end

  describe "POST route" do
    it "routes to create action" do
      expect(post: api_v1_create_collection_item_path(
        email: encrypted_email,
        collection_id: encrypted_id
      )).to route_to(
        controller: "api/v1/collection_items",
        action: "create",
        email: encrypted_email,
        collection_id: encrypted_id
      )
    end
  end

  describe "PUT route" do
    it "routes to update action" do
      expect(put: api_v1_update_collection_item_path(
        email: encrypted_email,
        collection_id: encrypted_id, id: item_id.to_s
      )).to route_to(
        controller: "api/v1/collection_items",
        action: "update",
        email: encrypted_email,
        collection_id: encrypted_id,
        id: item_id.to_s
      )
    end
  end

  describe "DELETE route" do
    it "routes to destroy action" do
      expect(delete: api_v1_delete_collection_item_path(
        email: encrypted_email,
        collection_id: encrypted_id,
        id: item_id.to_s
      )).to route_to(
        controller: "api/v1/collection_items",
        action: "destroy",
        email: encrypted_email,
        collection_id: encrypted_id,
        id: item_id.to_s
      )
    end
  end
end
