# config/routes.rb
#
Rails.application.routes.draw do
  resources :event_logs
  root to: 'static#index'

  resources :items
<<<<<<< HEAD

  resources :customers do
    collection do
      get :search
    end
  end
=======
  resources :customers
  resources :customers, only: [:search]
>>>>>>> cd351e47f7a5dff2d4cba12bc1eb4b39db6402b9

  namespace :admin do
      resources :users
      resources :customers
      resources :items
      root to: "users#index"
  end





  devise_for :users, skip: [:registrations]

end
