Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      post 'login', to: 'access_tokens#create'
      resources :sessions, only: [:create, :destroy]
      resources :users, only: [:create]
    end
  end
end
