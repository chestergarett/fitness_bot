module Api
  module V1
    class DietPlansController < ApplicationController
      def index
        plans = DietPlan.all
        render json: plans
      end

      def show
        plan = DietPlan.find(params[:id])
        render json: { data: plan.food_option }, status: :ok
      end

      def new
        @plan = DietPlan.new
        render json: plan
      end


      def create
        @plan = DietPlan.new(diet_params)
        @plan.user = current_user

        if @plan.save
          render :create
        else
          render :new
        end
      end

      def edit
        @plan = DietPlan.find(params[:id])
      end

      def update
        @plan = DietPlan.find(params[:id])

        if @plan.update
          redirect_to root_path
        else
          redirect_back fallback_location: root_path # baguhin pa later
        end
      end

      def destroy
        @plan = DietPlan.find(params[:id])
        @plan.destroy
        @plan.save

        # if @plan.save
        #   render diet_plans_path
        # end
      end

      private

      def diet_params
        params.require(:diet_plan).permit(:title, :description, :end_date)
      end
    end
  end
end
