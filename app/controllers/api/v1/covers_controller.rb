module Api
  module V1
    class CoversController < ApplicationController
      # GET /api/v1/covers
      def index
        @covers = Cover.all

        render json: @covers
      rescue StandardError => e
        Rails.logger.error("Failed to retrieve covers: #{e.message}")
        render json: { error: "Failed to retrieve covers" }, status: :internal_server_error
      end

      # GET /api/v1/covers/1
      def show
        render json: cover
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Cover not found: #{e.message}")
        render json: { error: "Cover not found" }, status: :not_found
      end

      # POST /api/v1/covers
      def create
        @cover = Cover.new(cover_params)

        @cover.save!
        render json: cover, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create cover: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /api/v1/covers/1
      def update
        cover.update!(cover_params)
        render json: cover
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update cover: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /api/v1/covers/1
      def destroy
        cover.destroy!
        render json: { message: "Cover deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete cover: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def cover
        @cover ||= Cover.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def cover_params
        params.expect(cover: [ :variant, :issue_id, :img_url ])
      end
    end
  end
end
