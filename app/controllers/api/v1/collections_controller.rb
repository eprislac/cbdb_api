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
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # POST /collections : Creates a new collection
      # @return [JSON] the new collection
      def create
        Rails.logger.debug("Creating new collection for user_id: #{user_id}")
        Rails.logger.debug("params: #{params.inspect}")
        @collection = user.collections.new(name: collection_params[:name])
        Rails.logger.debug(
          "Creating collection with params: #{collection_params.inspect}"
        )
        @collection.save!
        render json: @collection, status: :created
      rescue StandardError => _e
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

      def collection_params
        Rails.logger.debug("collection_params: #{params.inspect}")
        params.require(:collection).permit(:name)
      end

      def email
        EncryptionService.decrypt(params.expect(:email))
      end

      def user # helper method to fetch user by decrypted user_id
        @user ||= User.find_by_email(email)
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
