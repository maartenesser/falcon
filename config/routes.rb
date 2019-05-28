Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :claims, only: [ :new, :create, :show ]
  resources :parts, only: [:create, :update]
end
