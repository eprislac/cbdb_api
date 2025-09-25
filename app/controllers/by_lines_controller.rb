class ByLinesController < ApplicationController
  before_action :set_by_line, only: %i[ show update destroy ]

  # GET /by_lines
  def index
    @by_lines = ByLine.all

    render json: @by_lines
  end

  # GET /by_lines/1
  def show
    render json: @by_line
  end

  # POST /by_lines
  def create
    @by_line = ByLine.new(by_line_params)

    if @by_line.save
      render json: @by_line, status: :created, location: @by_line
    else
      render json: @by_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /by_lines/1
  def update
    if @by_line.update(by_line_params)
      render json: @by_line
    else
      render json: @by_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /by_lines/1
  def destroy
    @by_line.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_by_line
      @by_line = ByLine.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def by_line_params
      params.fetch(:by_line, {})
    end
end
