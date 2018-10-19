# config/routes.rb
#
Rails.application.routes.draw do
  root to: 'static#index'

  resources :items
  resources :customers

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
