Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :items
  resources :customers

  root to: 'static#login'

  devise_for :users, controllers: { sessions: 'users/sessions' }

  end

end
