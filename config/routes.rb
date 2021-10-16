Rails.application.routes.draw do
  devise_for :users
  get '/get-all' => 'get_all#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
    end
  end
end
