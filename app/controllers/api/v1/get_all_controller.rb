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
    end
  end
end
