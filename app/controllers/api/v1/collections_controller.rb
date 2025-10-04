# frozen_string_literal: true

require "pry"

module Api
  module V1
    class CollectionsController < ApiController
      # GET /collections
      def index
        @collections = Collection.all

        render json: @collections
      end

      # GET /collections/1
      def show
        render json: collection
      end

      # POST /collections : Creates a new collection
      # @return [JSON] the new collection
      def create
        @collection = user.collections.new(collection_params.except(:user_id))

        @collection.save!
        render json: @collection, status: :created, location: @collection
      rescue StandardError => e
        Rails.logger.error("ERROR: #{collection.errors.full_messages}")
        render json: @collection.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /collections/1
      def update
        collection.update!(collection_params.except(:user_id))
        render json: collection
      rescue StandardError => e
        Rails.logger.error("ERROR: #{collection.errors.full_messages}")
      render json: collection.errors, status: :unprocessable_entity
      end

      # DELETE /collections/1
      def destroy
        collection.destroy!
      end

      private
      def collection
        @collection ||= relation.find(EncryptionService.decrypt(params.expect(:id)))
      end

      # Only allow a list of trusted parameters through.
      def collection_params
        params.expect(collection: [ :user_id ])
      end

      def email
        decrypt(collection_params[:email])
      end

      def user # helper method to fetch user by decrypted user_id
        @user ||= User.find_by_email(EncryptionService.decrypt(email))
      end

      def user_id
        user.id
      end

      def relation
        Collection.where(user_id:)
      end
    end
  end
end
