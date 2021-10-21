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

      def edit
        @workout_plan = WorkoutPlan.find(params[:id])

        render :edit, status: :ok
      end

      def update
        @workout_plan = WorkoutPlan.find(params[:id])

        if @workout_plan.update(workout_plan_params)
          render :update, status: :created
        else
          render json: { errors: @workout_plan.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @workout_plan = WorkoutPlan.find(params[:id])
        @workout_plan.destroy
        @workout_plan.save

        render json: { data: 'Successfully deleted workout plan.' }, status: :no_content
      end

      def user_workouts
        @workouts = WorkoutPlan.where(user: current_user)

        render :user_workouts, status: :ok
      end

      private

      def workout_plan_params
        params.require(:workout_plan).permit(:bodyPart, :equipment, :gifUrl, :workout_id, :name, :target, :startDate, :endDate, :status, :reps, :sets)
      end
    end
  end
end
