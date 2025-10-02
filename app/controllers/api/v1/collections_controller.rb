# frozen_string_literal: true

module Api
  module V1
    class CollectionsController < ApplicationController
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

        if @collection.save
          render json: @collection, status: :created, location: @collection
        else
          render json: @collection.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /collections/1
      def update
        if collection.update(collection_params.except(:user_id))
          render json: collection
        else
          render json: collection.errors, status: :unprocessable_entity
        end
      end

      # DELETE /collections/1
      def destroy
        collection.destroy!
      end

      private
      def collection
        @collection ||= relation.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def collection_params
        params.expect(collection: [ :user_id ])
      end

      def email
        decrypt(collection_params[:email])
      end

      def user # helper method to fetch user by decrypted user_id
        @user ||= User.find_by_email(decrypt(email))
      end

      def relation
        Collection.where(user_id:)
      end
    end
  end
end
