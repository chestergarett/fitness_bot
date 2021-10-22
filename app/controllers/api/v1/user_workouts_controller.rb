module Api
  module V1
    class UserWorkoutsController < ApplicationController
  
      def create
        @user_workout = UserWorkout.new(user_workout_params)
        @user_workout.user = current_user

				if @user_workout.save
					render :create
				else
					render json: { error: @user_workout.errors.full_messages }
				end
      end

      def edit
        @user_workout = UserWorkout.find(params[:id])
      end

      def update
        @user_workout = UserWorkout.find(params[:id])
    
        if @user_workout.update(user_workout_params)
          render :update
        else
          render :edit
        end
      end

      def delete
        @user_workout = UserWorkout.find(params[:id])
        @user_workout.destroy

        render json: { data: 'successfully deleted user workout!' }
      end

      private
  
      def user_workout_params
        params.require(:user_workout).permit(:name, :bodyPart, :equipment, :gifUrl, :workout_id, :target, :start_date, :end_date, :sets, :reps)
      end
    end
  end
end
  