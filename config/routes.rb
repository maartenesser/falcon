Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :parts, only: [:create, :update ]
  # We should link the parts_part to user devise

  resources :parts, only: [ :show ] do
    resources :orders, only: [ :new, :create ]
  end

  resources :order_parts, only: [ :update ]
end
