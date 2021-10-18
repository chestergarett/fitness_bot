Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :diet_plans, :food_options
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
      resources :food_options, only: [:index]
      resources :diet_plans, only: [:index]
    end
  end
end
