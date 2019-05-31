Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [ :index, :show, :create, :update, :destroy]

  resources :order_parts, only: [ :update ]

  resources :claims

  get '/statistic', to: 'claims#statistic', as: :statistic

  resources :parts, only: [ :index, :show, :new, :create, :update ]
end
