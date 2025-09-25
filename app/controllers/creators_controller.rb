class CreatorsController < ApplicationController
  before_action :set_creator, only: %i[ show update destroy ]

  # GET /creators
  def index
    @creators = Creator.all

    render json: @creators
  end

  # GET /creators/1
  def show
    render json: @creator
  end

  # POST /creators
  def create
    @creator = Creator.new(creator_params)

    if @creator.save
      render json: @creator, status: :created, location: @creator
    else
      render json: @creator.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /creators/1
  def update
    if @creator.update(creator_params)
      render json: @creator
    else
      render json: @creator.errors, status: :unprocessable_entity
    end
  end

  # DELETE /creators/1
  def destroy
    @creator.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_creator
      @creator = Creator.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def creator_params
      params.expect(creator: [ :last_name, :first_name ])
    end
end
