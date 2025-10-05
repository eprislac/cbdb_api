# frozen_string_literal: true

module Api
  module V1
    class PublishersController < ApiController
      # GET /publishers
      def index
        @publishers = Publisher.all

        render json: @publishers
      rescue StandardError => e
        Rails.logger.error("Failed to retrieve publishers: #{e.message}")
        render json: { error: "Failed to retrieve publishers" }, status: :internal_server_error
      end

      # GET /publishers/1
      def show
        render json: publisher
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Publisher not found: #{e.message}")
        render json: { error: "Publisher not found" }, status: :not_found
      end

      # POST /publishers
      def create
        @publisher = Publisher.new(publisher_params)

        @publisher.save!
        render json: @publisher, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create publisher: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /publishers/1
      def update
        if publisher.update(publisher_params)
          render json: publisher
        else
          Rails.logger.error("Failed to update publisher: #{publisher.errors.full_messages.join(', ')}")
          render json: publisher.errors, status: :unprocessable_entity
        end
      end

      # DELETE /publishers/1
      def destroy
        publisher.destroy!
        render json: { message: "Publisher deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete publisher: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
        # Use callbacks to share common setup or constraints between actions.
        def publisher
          @publisher ||= Publisher.find(params.expect(:id))
        end

        # Only allow a list of trusted parameters through.
        def publisher_params
          params.expect(publisher: [ :name ])
        end
    end
  end
end
