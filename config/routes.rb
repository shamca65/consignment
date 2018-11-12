# config/routes.rb
#
Rails.application.routes.draw do

  devise_for :users, skip: [:registrations]
  root to: 'static#index'

  resources :event_logs
  resources :items

  resources :customers do
    collection do
      get :search
      get 'search_results' => 'customers#search_results', as: :search_results
      get '/items/:id', to: 'customers#items', as: 'items'
    end
  end

  resources :customers

  namespace :admin do
      resources :users
      resources :customers
      resources :items
      root to: "users#index"
  end

end
