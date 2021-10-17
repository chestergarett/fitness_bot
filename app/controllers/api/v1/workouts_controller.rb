module Api
  module V1
    class WorkoutsController < ApplicationController
      skip_before_action :authenticate_user!

      def get_all
        get_all = Rapid::Client.get_all
        render json: get_all
      end

      def get_by_id
        get_by_id = Rapid::Client.get_by_id(params[:id])
        render json: get_by_id
      end

      def get_by_name
        get_by_name = Rapid::Client.get_by_name(params[:name])
        render json: get_by_name
      end

      def get_by_body_part
        get_by_body_part = Rapid::Client.get_by_body_part(params[:body_part])
        render json: get_by_body_part
      end

      def get_by_target
        get_by_target = Rapid::Client.get_by_target(params[:target])
        render json: get_by_target
      end

      def get_by_equipment
        get_by_equipment = Rapid::Client.get_by_equipment(params[:equipment])
        render json: get_by_equipment
      end
    end
  end
end
