# config/routes.rb
#
Rails.application.routes.draw do

  resources :configs
  resources :photos
  devise_for :users, controllers: {sessions: 'users/sessions'}

  root to: 'static#index'

  resources :event_logs

  resources :items do
  	collection do
  		get 'pickups' => 'item#pickups', as: :pickups
		end
	end

  resources :customers do
    collection do
      get :search
      get 'search_results' => 'customers#search_results', as: :search_results
      get '/items/:id', to: 'customers#items', as: 'items'
      get 'takein', to: 'customers#takein', as: 'takein'
    end
  end

  resources :customers, defaults: {format: 'json'}

  namespace :admin do
    resources :users
    resources :customers
    resources :items
  end

end
