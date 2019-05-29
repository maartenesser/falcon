Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :parts, only: [ :show ] do
    resources :orders, only: [ :new, :create ]
  end

  resources :parts, only: [:create, :update ]
  # We should link the parts_part to user devise
end
