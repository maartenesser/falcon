Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :parts, only: [:create, :update, :show ]

  resources :orders, only: [ :show ]

  resources :order_parts, only: [ :update ]
end
