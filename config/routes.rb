Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      #authentication
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]

      #workouts
      get '/workouts/get_by_all' => 'workouts#get_all'
      get '/workouts/get_by_id' => 'workouts#get_by_id'
      get '/workouts/get_by_body_part' => 'workouts#get_by_body_part'
      get '/workouts/get_by_name' => 'workouts#get_by_name'
      get '/workouts/get_by_target' => 'workouts#get_by_target'
      get '/workouts/get_by_equipment' => 'workouts#get_by_equipment'
    end
  end
end
