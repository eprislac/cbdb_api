# frozen_string_literal: true

module Api
  module V1
    class IssuesController < ApplicationController
      # GET /issues
      def index
        @issues = Issue.all

        render json: @issues
      rescue StandardError => e
        Rails.logger.error("Failed to retrieve issues: #{e.message}")
        render json: { error: "Failed to retrieve issues" }, status: :internal_server
      end

      # GET /issues/1
      def show
        render json: issue
      rescue ActiveRecord::RecordNotFound => e
        Rails.logger.error("Issue not found: #{e.message}")
        render json: { error: "Issue not found" }, status: :not_found
      end

      # POST /issues
      def create
        @issue = Issue.new(issue_params)

        @issue.save!
        render json: @issue, status: :created
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to create issue: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # PATCH/PUT /issues/1
      def update
        issue.update!(issue_params)
        render json: issue
      rescue ActiveRecord::RecordInvalid => e
        Rails.logger.error("Failed to update issue: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      # DELETE /issues/1
      def destroy
        issue.destroy!
        render json: { message: "Issue deleted successfully" }, status: :ok
      rescue ActiveRecord::RecordNotDestroyed => e
        Rails.logger.error("Failed to delete issue: #{e.record.errors.full_messages.join(', ')}")
        render json: e.record.errors, status: :unprocessable_entity
      end

      private
      def issue
        @issue ||= Issue.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def issue_params
        params.expect(issue: [ :number, :legacy_number, :cover_date, :publication_id ])
      end
    end
  end
end
