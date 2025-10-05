# frozen_string_literal: true

module Api
  module V1
    class PublicationTypesController < ApplicationController
      # GET /publication_types
      def index
        @publication_types = PublicationType.all

        render json: @publication_types
      rescue StandardError => e
        Rails.logger.error("Failed to fetch publication types: #{e.message}")
        render json: {
          error: "Failed to fetch publication types"
        }, status: :internal
      end

      # GET /publication_types/1
      def show
        render json: publication_type
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Publication type not found: #{e.message}")
        render json: { error: "Publication type not found" }, status: :not_found
      end

      # POST /publication_types
      def create
        @publication_type = PublicationType.new(publication_type_params)
        @publication_type.save!
        render json: @publication_type, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create publication type: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /publication_types/1
      def update
        publication_type.update!(publication_type_params)
        render json: publication_type
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update publication type: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /publication_types/1
      def destroy
        publication_type.destroy!
        render json: { message: "Publication type deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete publication type: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def publication_type
        @publication_type ||= PublicationType.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def publication_type_params
        params.expect(publication_type: [ :name ])
      end
    end
  end
end
