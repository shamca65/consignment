Rails.application.routes.draw do
  namespace :admin do
      resources :users
      resources :customers
      resources :items

      root to: "users#index"
    end
  resources :items
  resources :customers

  devise_for :users, skip: [:registrations]
  root to: 'static#index'

end
