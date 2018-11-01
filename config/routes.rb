# config/routes.rb
#
Rails.application.routes.draw do
  resources :event_logs
  root to: 'static#index'

  resources :items

  resources :customers do
    collection do
      get :search
      get 'search_results' => 'customers#search_results', as: :search_results
    end
  end

  resources :customers

  namespace :admin do
      resources :users
      resources :customers
      resources :items
      root to: "users#index"
  end

  devise_for :users, skip: [:registrations]

end
