module Api
  module V1
    class UsersController < ApplicationController
      skip_before_action :authenticate_user_from_token!, only: :create

      def create
        @user = User.new(user_params)

        if @user.save
          render :create
        else
          head(:unprocessable_entity)
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation, :username)
      end
    end
  end
end
