module Api
  module V1
    class ConditionsController < ApplicationController
      # GET /conditions
      def index
        @conditions = Condition.all

        render json: @conditions
      end

      # GET /conditions/1
      def show
        render json: condition
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Condition not found: #{e.message}")
        render json: { error: "Condition not found" }, status: :not_found
      end

      # POST /conditions
      def create
        @condition = Condition.new(condition_params)

        @condition.save!
        render json: @condition, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create condition: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /conditions/1
      def update
        condition.update!(condition_params)
        render json: condition
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update condition: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /conditions/1
      def destroy
        condition.destroy!
        render json: { message: "Condition deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete condition: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def condition
        @condition ||= Condition.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def condition_params
        params.expect(condition: [ :name ])
      end
    end
  end
end
