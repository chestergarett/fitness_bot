module Api
  module V1
    class ClientProfilesController < ApplicationController
      def create
        @client_profile = ClientProfile.new(client_profile_params)
        @client_profile.user = current_user

        if @client_profile.save
          render :create
        else
          head(:unprocessable_entity)
        end
      end

      private

      def client_profile_params
        params.require(:client_profile).permit(:first_name, :last_name, :height, :current_weight, :goal_weight, :sex, :age, :workout_frequency, :body_type, :target_date, :food_preference)
      end
    end
  end
end
