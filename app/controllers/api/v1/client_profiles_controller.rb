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
                                            endDate: @client_profile.created_at + n.day,
                                            reps: 10,
                                            sets: 3)
            @workout_plan.user = current_user
            @workout_plan.save
            n -= 1
          end

          render :create
        else
          head(:unprocessable_entity)
        end
      end

      private

      def client_profile_params
        params.require(:client_profile).permit(:first_name, :last_name, :height, :current_weight, :goal_weight, :sex, :age, :workout_frequency, :body_type, :target_date, :food_preference)
      end
    end
  end
end
