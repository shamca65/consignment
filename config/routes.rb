Rails.application.routes.draw do
  resources :items
  resources :customers

  devise_for :users, skip: [:registrations]
  root to: 'static#index'

end
