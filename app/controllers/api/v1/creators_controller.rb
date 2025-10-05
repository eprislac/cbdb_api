module Api
  module V1
    class CreatorsController < ApplicationController
      # GET /creators
      def index
        @creators = Creator.all

        render json: @creators
      rescue StandardError => e
        Rails.logger.error("Failed to fetch creators: #{e.message}")
        render json: { error: "Failed to fetch creators" }, status: :internal_server_error
      end

      # GET /creators/1
      def show
        render json: creator
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Creator not found: #{e.message}")
        render json: { error: "Creator not found" }, status: :not_found
      end

      # POST /creators
      def create
        @creator = Creator.new(creator_params)

        @creator.save!
        render json: @creator, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create creator: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /creators/1
      def update
        creator.update!(creator_params)
        render json: creator
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update creator: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /creators/1
      def destroy
        creator.destroy!
        render json: { message: "Creator deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete creator: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def creator
        @creator ||= Creator.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def creator_params
        params.expect(creator: [ :last_name, :first_name ])
      end
    end
  end
end
