require "rails_helper"

RSpec.describe Api::V1::CollectionsController, type: :routing do
  let(:user) { create(:user, email: Faker::Internet.email) }
  let(:collection) { create(:collection, user: user) }
  before(:each) do
    allow(EncryptionService)
      .to receive(:decrypt).with(user.email).and_return(user.email)
    allow(EncryptionService)
      .to receive(:decrypt).with(collection.id).and_return(collection.id)
  end

  describe "routing" do
    it "routes to #index" do
      expect(get: api_v1_user_collections_path(email: user.email))
        .to route_to(
          controller: "api/v1/collections",
          action: "index",
          email: user.email,
          format: "json"
        )
    end

    it "routes to #show" do
      expect(get: api_v1_user_collection_path(email: user.email, id: collection.id))
        .to route_to(
          controller: "api/v1/collections",
          action: "show",
          email: user.email,
          id: collection.id,
          format: "json"
        )
    end


    it "routes to #create" do
      expect(post: api_v1_create_user_collection_path(email: user.email))
        .to route_to(
          controller: "api/v1/collections",
          action: "create",
          email: user.email,
          format: "json"
        )
    end

    it "routes to #update via PUT" do
      expect(put: api_v1_update_user_collection_path(email: user.email, id: collection.id))
        .to route_to(
          controller: "api/v1/collections",
          action: "update",
          email: user.email,
          id: collection.id,
          format: "json"
        )
    end

    it "routes to #destroy" do
      expect(delete: api_v1_delete_user_collection_path(email: user.email, id: collection.id))
        .to route_to(
          controller: "api/v1/collections",
          action: "destroy",
          email: user.email,
          id: collection.id,
          format: "json"
        )
    end
  end
end
