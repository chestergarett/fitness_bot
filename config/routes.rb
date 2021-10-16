Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get '/get-all' => 'get_all#get_all'
      get '/get-by-id' => 'get_all#get_by_id'
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
    end
  end
end
