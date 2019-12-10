# config/routes.rb
#
Rails.application.routes.draw do

  devise_for :users, controllers: {sessions: 'users/sessions'}

  root to: 'static#index'

  resources :event_logs

  get '/static/new' => 'static#new', as: :new

  resources :configs do
    collection do
      post 'new' => 'configs#new', as: :new
      get '/edit/:slug' => 'configs#edit', as: :edit
    end
  end

  resources :items do
  	collection do
  		get 'pickups' => 'items#pickups', as: :pickups
      post 'updatepickups' => 'items#updatepickups', as: :updatepickups
      get '/takein/:id' => 'items#takein', as: :takein
      get '/addtakein/:id' => 'items#addtakein', as: :addtakein
		end
	end

  resources :customers do
    collection do
      get :search
      get 'search_results' => 'customers#search_results', as: :search_results
      get '/items/:id' => 'customers#items', as: 'items'
      get '/takein/:id' => 'customers#takein', as: :takein
    end
  end

  resources :customers, defaults: {format: 'json'}

  namespace :admin do
    resources :users
    resources :customers
    resources :items
  end

end
