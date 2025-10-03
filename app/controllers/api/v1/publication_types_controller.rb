# frozen_string_literal: true

module Api
  module V1
    class PublicationTypesController < ApplicationController
      # GET /publication_types
      def index
        @publication_types = PublicationType.all

        render json: @publication_types
      end

      # GET /publication_types/1
      def show
        render json: publication_type
      end

      # POST /publication_types
      def create
        @publication_type = PublicationType.new(publication_type_params)

        if @publication_type.save
          render json: @publication_type, status: :created, location: @publication_type
        else
          render json: @publication_type.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /publication_types/1
      def update
        if publication_type.update(publication_type_params)
          render json: publication_type
        else
          render json: publication_type.errors, status: :unprocessable_entity
        end
      end

      # DELETE /publication_types/1
      def destroy
        publication_type.destroy!
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
