Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [ :show]
  resources :parts, only: [:create, :update]
end
