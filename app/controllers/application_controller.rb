class ApplicationController < ActionController::API
  def index
    render json: { msg: "Bah weep gra-nah weep ninny-bong!!!" }, status: :ok
  end
end
