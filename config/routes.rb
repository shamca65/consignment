# config/routes.rb
#
Rails.application.routes.draw do
  resources :event_logs
  root to: 'static#index'

  resources :items

  resources :customers do
    collection do
      get :search
    end
  end

  namespace :admin do
      resources :users
      resources :customers
      resources :items
      root to: "users#index"
  end

  namespace :api do
    namespace :v1 do
      resources :movies, only: [:index]
    end
  end

  devise_for :users, skip: [:registrations]

end
