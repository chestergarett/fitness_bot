module Api
  module V1
    class ClientProfilesController < ApplicationController
      def create
        @client_profile = ClientProfile.new(client_profile_params)
        @client_profile.user = current_user

        if @client_profile.save

          n = 14

          while n.positive?
            if @client_profile.current_weight < 50 && @client_profile.body_type == 'Underweight'
              @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                              name: 'pull-up',
                                              status: 'NOT STARTED',
                                              bodyPart: 'back',
                                              equipment: 'body weight',
                                              gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0652.gif',
                                              target: 'lats',
                                              workout_id: 652,
                                              startDate: @client_profile.created_at + n.day,
                                              endDate: @client_profile.created_at + n.day,
                                              reps: 12,
                                              sets: 3)
              @workout_plan.user = current_user
              @workout_plan.save

            elsif @client_profile.current_weight > 50 && @client_profile.body_type == 'Normal weight'
              @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                              name: 'stationary bike walk',
                                              status: 'NOT STARTED',
                                              bodyPart: 'cardio',
                                              equipment: 'leverage machine',
                                              gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0798.gif',
                                              target: 'cardiovascular system',
                                              workout_id: 798,
                                              startDate: @client_profile.created_at + n.day,
                                              endDate: @client_profile.created_at + n.day,
                                              reps: 15,
                                              sets: 4)
              @workout_plan.user = current_user
              @workout_plan.save

            elsif @client_profile.current_weight > 50 && @client_profile.body_type == 'Overweight'
              @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                            name: 'barbell straight leg deadlift',
                                            status: 'NOT STARTED',
                                            bodyPart: 'upper legs',
                                            equipment: 'barbell',
                                            gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0116.gif',
                                            target: 'hamstrings',
                                            workout_id: 116,
                                            startDate: @client_profile.created_at + n.day,
                                            endDate: @client_profile.created_at + n.day,
                                            reps: 15,
                                            sets: 4)
              @workout_plan.user = current_user
              @workout_plan.save

            elsif @client_profile.current_weight > 50 && @client_profile.body_type == 'Obese'
              @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                            name: 'run',
                                            status: 'NOT STARTED',
                                            bodyPart: 'cardio',
                                            equipment: 'body weight',
                                            gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0685.gif',
                                            target: 'cardiovascular system',
                                            workout_id: 685,
                                            startDate: @client_profile.created_at + n.day,
                                            endDate: @client_profile.created_at + n.day,
                                            reps: 15,
                                            sets: 5)
              @workout_plan.user = current_user
              @workout_plan.save

            else 
              @workout_plan = WorkoutPlan.new(workout_type: 'RECOMMENDED',
                                            name: 'barbell straight leg deadlift',
                                            status: 'NOT STARTED',
                                            bodyPart: 'upper legs',
                                            equipment: 'barbell',
                                            gifUrl: 'http://d205bpvrqc9yn1.cloudfront.net/0116.gif',
                                            target: 'hamstrings',
                                            workout_id: 116,
                                            startDate: @client_profile.created_at + n.day,
                                            endDate: @client_profile.created_at + n.day,
                                            reps: 15,
                                            sets: 4)
              @workout_plan.user = current_user
              @workout_plan.save
            end

            n -= 1
          end

          @diet_plan = DietPlan.new(title: 'The Ultimate Diet', description: 'recommended for you!', end_date: Time.now.in_time_zone, notes: 'Start taking steps in your fitness journey.')
          @diet_plan.user = current_user
          @diet_plan.save

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
