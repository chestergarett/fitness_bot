module Api
  module V1
    class WorkoutPlansController < ApplicationController
      def create
        @workout_plan = WorkoutPlan.new(workout_plan_params)
        @workout_plan.user = current_user
        if @workout_plan.save
          render :create, status: :created
        else
          render json: { errors: @workout_plan.errors.full_messages }, status: :unprocessable_entity
        end
      end

      private

      def workout_plan_params
        params.require(:workout_plan).permit(:bodyPart, :equipment, :gifUrl, :workout_id, :name, :target, :startDate, :endDate, :status, :reps, :sets)
      end
    end
  end
end
