module Api
  module V1
    class ByLinesController < ApplicationController
      # GET /by_lines
      def index
        @by_lines = ByLine.all

        render json: @by_lines
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # GET /by_lines/1
      def show
        render json: by_line
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      # POST /by_lines
      def create
        @by_line = ByLine.new(by_line_params)

        @by_line.save!
        render json: @by_line, status: :created, location: @by_line
      rescue StandardError => _e
        Rails.logger.error("ERROR: #{@by_line.errors.full_messages}")
        render json: @by_line.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /by_lines/1
      def update
        by_line.update!(by_line_params)
        render json: by_line
      rescue StandardError => e
        Rails.logger.error("ERROR: #{by_line.errors.full_messages}")
        render json: by_line.errors, status: :unprocessable_entity
      end

      # DELETE /by_lines/1
      def destroy
        by_line.destroy!
        render json: { message: "By line deleted successfully" }, status: :ok
      rescue StandardError => e
        Rails.logger.error("ERROR: #{e.message}")
        render json: { error: e.message }, status: :unprocessable_entity
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def by_line
        @by_line ||= ByLine.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def by_line_params
        params.require(:by_line).permit(:name)
      end
    end
  end
end
