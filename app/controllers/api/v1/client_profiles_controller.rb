module Api
  module V1
    class ClientProfilesController < ApplicationController
      def create
        @client_profile = ClientProfile.new(client_profile_params)
        @client_profile.user = current_user

        if @client_profile.save

          n = 14

          while n.positive?
            @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                            name: 'band close-grip push-up',
                                            status: 'NOT STARTED',
                                            bodyPart: 'upper arms',
                                            equipment: 'band',
                                            gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0975.gif',
                                            target: 'triceps',
                                            workout_id: 975,
                                            startDate: @client_profile.created_at + n.day,
                                            startDate_js: @client_profile.created_at + n.day,
                                            endDate: @client_profile.created_at + n.day,
                                            reps: 10,
                                            sets: 3)
            @workout_plan.user = current_user
            @workout_plan.save
            n -= 1
          end

          # diet plan recommendations
          @diet_plan = DietPlan.new(title: 'The Ultimate Diet', description: 'recommended for you!', end_date: @client_profile[:target_date], notes: 'Start taking steps in your fitness journey.')
          @diet_plan.user = current_user
          @diet_plan.save
          # @recommended_recipes = CalculateBmi.call(client_profile_params[:current_weight].to_f, client_profile_params[:height].to_f)

          # render json: { recipe: @recommended_recipes }
          render :create
        else
          head(:unprocessable_entity)
        end
      end

      def update
        @client_profile = ClientProfile.find(params[:id])

        if @client_profile.update(client_profile_params)
          render :update, status: :ok
        else
          render json: { errors: @client_profile.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def index
        @client_profile = ClientProfile.where(user: current_user)

        render json: { data: @client_profile }, status: :ok
      end

      private

      def client_profile_params
        params.require(:client_profile).permit(:first_name, :last_name, :height, :current_weight, :goal_weight, :sex, :age, :workout_frequency, :body_type, :target_date, :food_preference)
      end
    end
  end
end
