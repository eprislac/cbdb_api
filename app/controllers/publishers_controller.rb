class PublishersController < ApplicationController
  # GET /publishers
  def index
    @publishers = Publisher.all

    render json: @publishers
  end

  # GET /publishers/1
  def show
    render json: publisher
  end

  # POST /publishers
  def create
    @publisher = Publisher.new(publisher_params)

    if @publisher.save
      render json: @publisher, status: :created, location: @publisher
    else
      render json: @publisher.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /publishers/1
  def update
    if publisher.update(publisher_params)
      render json: publisher
    else
      render json: publisher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /publishers/1
  def destroy
    publisher.destroy!
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
