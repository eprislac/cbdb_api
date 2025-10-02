# # frozen_string_literal: true
#
module Api
  module V1
    # calling this controller collection_items, but it's for class Copy
    class CollectionItemsController < ApiController
      # GET /:email/collection/:collection_id/collection_items
      def index
        @collection_items = collection.copies.all

        render json: @collection_items
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # GET /collection_items/1
      def show
        render json: collection_item
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # POST /collection_items : Creates a new collection_item
      # @return [JSON] the new collection_item
      def create
        @collection_item = collection.copies.new(collection_item_params)

        if @collection_item.save
          render json: @collection_item,
            status: :created
        else
          Rails.logger.error("ERROR: #{@collection_item.errors.full_messages}")
          render json: @collection_item.errors, status: :unprocessable_entity
        end
      end

      # PATCH /PUT /collection_items/1
      def update
        if collection_item.update(collection_item_params)
          render json: collection_item
        else
          Rails.logger.error("ERROR: #{collection_item.errors.full_messages}")
          render json: collection_item.errors, status: :unprocessable_entity
        end
      end

      # DELETE /collection_items/1
      def destroy
        collection_item.destroy!

        render json: { message: "Collection item deleted successfully" }, status: :ok
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      def collection # helper method to fetch collection by decrypted collection_id
        @collection ||= user.collections.find(collection_id)
      end

      def user # helper method to fetch user by decrypted email
        @user ||= User.find_by_email(email)
      end

      def collection_item
        @collection_item ||= collection.copies.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def collection_item_params
        params.expect(
          collection_item: %i[
            id issue_id publication_id publication_type_id acquired_on
            creator_id by_line_id condition_id publisher_id notes
            price_paid issue_number volume_number year month
          ]
        ).require(:collection_item).permit!
      end

      def email
        decrypt(params.expect(:email))
      end

      def collection_id
        decrypt(params.expect(:collection_id))
      end
    end
  end
end
