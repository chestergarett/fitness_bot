Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :diet_plans, :food_options
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      #authentication
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
      resources :user_workouts

      #workouts
      get '/workouts/get_all' => 'workouts#workout_all'
      get '/workouts/get_by_id' => 'workouts#workout_by_id'
      get '/workouts/get_by_body_part' => 'workouts#workout_by_body_part'
      get '/workouts/get_by_name' => 'workouts#workout_by_name'
      get '/workouts/get_by_target' => 'workouts#workout_by_target'
      get '/workouts/get_by_equipment' => 'workouts#workout_by_equipment'

      #diet plans
      resources :food_options, only: [:index]
      resources :diet_plans

      #client_profile
      resources :client_profiles, only: [:create]

      #workout_plans
      get '/workout_plans/user_workouts' => 'workout_plans#user_workouts'
      resources :workout_plans
    end
  end
end
