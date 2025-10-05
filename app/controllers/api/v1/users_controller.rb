module Api
  module V1
    class UsersController < Api::ApiController
      # GET /api/v1/users
      def index
        @users = User.all

        render json: @users
      end

      # GET /api/v1/users/by_enc_str
      def by_enc_str
        Rails.logger.debug("enc_str: #{params.expect(:enc_str)}")
        decrypted = EncryptionService.decrypt(params.expect(:enc_str))
        Rails.logger.debug("decrypted: #{decrypted}")
        @user ||= User.find_by_email(decrypted)

        render json: @user ?
          { data: @user, message: "OK" } :
          { data: nil, message: "Not Found", email: decrypted  }
      rescue ActiveRecord::RecordNotFound => e
        render json: { error: e.class, data: nil, message: "Not Found", email: decrypted }
      rescue StandardError => e
        render json: { error: e.class, message: e.message }
      end

      # POST api/v1/users
      def create
        @user = User.new(user_params)

        if @user.save
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /users/1
      def update
        if user.update(user_params)
          render json: user
        else
          render json: user.errors, status: :unprocessable_entity
        end
      end

      # DELETE /users/1
      def destroy
        user.destroy!
      end

      private

      def user
        @user ||= User.find(params.expect(:id))
      end

      # Only allow a list of trusted parameters through.
      def user_params
        params.expect(user: [ :name, :email ])
      end
    end
  end
end
