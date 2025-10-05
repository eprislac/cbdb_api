# frozen_string_literal: true

module Api
  module V1
    class PublicationsController < ApplicationController
      # GET /publications
      def index
        @publications = Publication.all

        render json: @publications
      rescue StandardError => e
        Rails.logger.error("Failed to retrieve publications: #{e.message}")
        render json: { error: "Failed to retrieve publications" }, status: :internal_server_error
      end

      # GET /publications/1
      def show
        render json: publication
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Publication not found: #{e.message}")
        render json: { error: "Publication not found" }, status: :not_found
      end

      # POST /publications
      def create
        @publication = Publication.new(publication_params)

        @publication.save!
        render json: publication, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create publication: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /publications/1
      def update
        publication.update!(publication_params)
        render json: publication
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update publication: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /publications/1
      def destroy
        publication.destroy!
        render json: { message: "Publication deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete publication: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      def publication
        @publication ||= Publication.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def publication_params
        params.expect(publication: %i[
          title start_date end_date volume publication_type_id publisher_id
        ])
      end
    end
  end
end
