require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  let(:user) { create(:user, email: Faker::Internet.email) }
  let(:collection) { create(:collection, user: user, name: 'New Collection') }
  let(:app_secret) { ENV['APP_SECRET'] }
  let(:key) { [ app_secret ].pack('H*') } # Decode hex to binary
  let(:nonce) { RbNaCl::Random.random_bytes(RbNaCl::SecretBox.nonce_bytes) }
  let(:message) { user.email }
  let(:box) { RbNaCl::SecretBox.new(key) }
  let(:ciphertext) { box.encrypt(nonce, message) }
  let(:encrypted_text) { "#{Base64.encode64(nonce).strip}:#{Base64.encode64(ciphertext).strip}" }

  describe "routing" do
    it "routes to #index" do
      expect(get: api_v1_user_collections_path(email: encrypted_text))
        .to route_to(
          controller: "api/v1/collections",
          action: "index",
          email: encrypted_text
        )
    end

    let(:ciphertext) { box.encrypt(nonce, collection.id.to_s) }
    let(:encrypted_id) { "#{Base64.encode64(nonce).strip}:#{Base64.encode64(ciphertext).strip}" }

    it "routes to #show" do
      expect(get: api_v1_user_collection_path(email: encrypted_text, id: encrypted_id))
        .to route_to(
          controller: "api/v1/collections",
          action: "show",
          email: encrypted_text,
          id: encrypted_id
        )
    end

    it "routes to #create" do
      expect(post: api_v1_create_user_collection_path(email: encrypted_text))
        .to route_to(
          controller: "api/v1/collections",
          action: "create",
          email: encrypted_text
        )
    end

    it "routes to #destroy" do
      expect(delete: api_v1_delete_user_collection_path(email: encrypted_text, id: encrypted_id))
        .to route_to(
          controller: "api/v1/collections",
          action: "destroy",
          email: encrypted_text,
          id: encrypted_id
        )
    end
  end
end
