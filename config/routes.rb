# config/routes.rb
#
Rails.application.routes.draw do
  resources :event_logs
  root to: 'static#index'

  resources :items
  resources :customers
  resources :customers, only: [:search]

  namespace :admin do
      resources :users
      resources :customers
      resources :items
      root to: "users#index"
  end





  devise_for :users, skip: [:registrations]

end
