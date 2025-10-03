module Api
  module V1
    class CreditsController < ApplicationController
      # GET /credits
      def index
        @credits = Credit.all

        render json: @credits
      end

      # GET /credits/1
      def show
        render json: credit
      end

      # POST /credits
      def create
        @credit = Credit.new(credit_params)

        if @credit.save
          render json: @credit, status: :created, location: @credit
        else
          render json: @credit.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /credits/1
      def update
        if credit.update(credit_params)
          render json: credit
        else
          render json: credit.errors, status: :unprocessable_entity
        end
      end

      # DELETE /credits/1
      def destroy
        credit.destroy!
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def credit
        @credit ||= Credit.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def credit_params
        params.expect(credit: [ :by_line_id, :creator_id, :issue_id ])
      end
    end
  end
end
