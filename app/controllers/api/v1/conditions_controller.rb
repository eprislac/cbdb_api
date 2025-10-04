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
      end

      # POST /conditions
      def create
        @condition = Condition.new(condition_params)

        if @condition.save
          render json: @condition, status: :created, location: @condition
        else
          render json: @condition.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /conditions/1
      def update
        if condition.update(condition_params)
          render json: condition
        else
          render json: condition.errors, status: :unprocessable_entity
        end
      end

      # DELETE /conditions/1
      def destroy
        condition.destroy!
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
