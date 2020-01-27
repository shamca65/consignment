# config/routes.rb
#
Rails.application.routes.draw do

  resources :sale_summaries
  root to: 'static#index'

  devise_for :users, controllers: {sessions: 'users/sessions'}

  resources :sale_items
  resources :sales
  resources :event_logs


  get '/static/new' => 'static#new', as: :new
  get '/search(.:format)' => 'sale_items#search', as: :search_sale_items
  post '/sale_items/commit_sale' => 'sale_items#commit_sale', as: :commit_sale
  post '/sale_summaries/show' => 'sale_summaries#show', as: :receipt

  resources :configs do
    collection do
      post 'new' => 'configs#new', as: :new
      get '/edit/:slug' => 'configs#edit', as: :edit
    end
  end

  resources :items do
  	collection do
  		get 'donations' => 'items#donations', as: :donations
      post 'updatedonations' => 'items#updatedonations', as: :updatedonations
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
