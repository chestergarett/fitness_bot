module Api
  module V1
    class GetAllController < ApplicationController
      skip_before_action :authenticate_user!

      def get_by_id
        get_by_id = Rapid::Client.get_by_id(params[:id])
        render json: get_by_id
      end

      def get_all
        get_all = Rapid::Client.get_all
        render json: get_all
      end

      def get_by_bodyPart
        get_by_bodyPart = Rapid::Client.get_by_bodyPart(params[:bodyPart])
        render json: get_by_bodyPart
      end

      def get_by_name
        get_by_name = Rapid::Client.get_by_name(params[:name])
        render json: get_by_name
      end
    end
  end
end
