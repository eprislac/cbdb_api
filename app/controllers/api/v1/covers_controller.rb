module Api
  module V1
    class CoversController < ApplicationController
      # GET /api/v1/covers
      def index
        @covers = Cover.all

        render json: @covers
      end

      # GET /api/v1/covers/1
      def show
        render json: cover
      end

      # POST /api/v1/covers
      def create
        @cover = Cover.new(cover_params)

        if @cover.save
          render json: cover, status: :created, location: @cover
        else
          render json: cover.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /api/v1/covers/1
      def update
        if cover.update(cover_params)
          render json: cover
        else
          render json: cover.errors, status: :unprocessable_entity
        end
      end

      # DELETE /api/v1/covers/1
      def destroy
        cover.destroy!
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
