Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :parts, only: [:create, :update, :show ]
  # We should link the parts_part to user devise

  resources :orders, only: [ :show ]

  resources :order_parts, only: [ :update ]
end
