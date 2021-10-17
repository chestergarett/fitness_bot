module Api
  module V1
    class WorkoutsController < ApplicationController
      skip_before_action :authenticate_user!

      def workout_all
        get_all = Rapid::Client.workout_all
        render json: get_all
      end

      def workout_by_id
        get_by_id = Rapid::Client.workout_by_id(params[:id])
        render json: get_by_id
      end

      def workout_by_name
        get_by_name = Rapid::Client.workout_by_name(params[:name])
        render json: get_by_name
      end

      def workout_by_body_part
        get_by_body_part = Rapid::Client.workout_by_body_part(params[:body_part])
        render json: get_by_body_part
      end

      def workout_by_target
        get_by_target = Rapid::Client.workout_by_target(params[:target])
        render json: get_by_target
      end

      def workout_by_equipment
        get_by_equipment = Rapid::Client.workout_by_equipment(params[:equipment])
        render json: get_by_equipment
      end
    end
  end
end
