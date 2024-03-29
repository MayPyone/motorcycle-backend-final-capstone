Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:create], path: 'signup'
      resources :reservations, only: [:create, :index, :show, :destroy]
      resources :motorcycles, only: [:create, :index, :show, :destroy]  # Removed the extra comma here
    end
  end

  post '/api/v1/login', to: 'api/v1/authentication#login', defaults: { format: :json }
end
