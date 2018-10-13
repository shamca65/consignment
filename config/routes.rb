Rails.application.routes.draw do

  devise_for :users
  resources :items
  resources :customers

  root to: 'static#index'


end
