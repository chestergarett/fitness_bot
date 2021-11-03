module Api
  module V1
    class DashboardsController < ApplicationController
      def index
        current_weight = current_user.client_profile.current_weight
        target_weight = current_user.client_profile.goal_weight
        diet_plan = DietPlan.where(user: current_user)
        calorie_intake = Food.where(diet_plan: diet_plan, status: 'COMPLETED').sum(:calories)
        workout_count = WorkoutPlan.where(user: current_user, status: 'COMPLETED').count
        workout_pie = WorkoutPlan.select('target, status, COUNT(target) as count').where(user: current_user).group(:target, :status)

        render json: { weight: current_weight, target_weight: target_weight, calorie_intake: calorie_intake, workout_count: workout_count, workout_pie: workout_pie }
      end
    end
  end
end
