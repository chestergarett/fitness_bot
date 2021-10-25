module Api
  module V1
    class DietPlansController < ApplicationController
      def index
        plans = DietPlan.where(user: current_user)
        render json: { data: plans }, status: :ok
      end

      def show
        @plan = DietPlan.find(params[:id])
        render :show, status: :ok
      end

      def create
        @plan = DietPlan.new(diet_params)
        @plan.user = current_user

        if @plan.save
          render :create
        else
          render json: { errors: @plan.errors.full_messages }, status: :unprocessable_entity 
        end
      end

      def update
        @plan = DietPlan.find(params[:id])

        if @plan.update(diet_params)
          render :update
        else
          render json: { errors: @plan.errors.full_messages }, status: :unprocessable_entity 
        end
      end

      def destroy
        @plan = DietPlan.find(params[:id])
        @plan.destroy
        @plan.save

        render json: { data: 'Successfully deleted diet plan.' }, status: :no_content
      end

      private

      def diet_params
        params.require(:diet_plan).permit(:title, :description, :end_date)
      end
    end
  end
end
