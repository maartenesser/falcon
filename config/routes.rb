Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [ :show ]

  resources :order_parts, only: [ :update ]

  resources :claims, only: [:new, :create, :show, :index, :edit, :destroy, :update]

  resources :parts, only: [:create, :update, :new, :show, :index]
end
