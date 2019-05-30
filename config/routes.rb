Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :orders, only: [ :show ]

  resources :order_parts, only: [ :update ]

  resources :claims

  get '/statistic', to: 'claims#statistic', as: :statistic

  resources :parts, only: [:create, :update, :new, :show, :index]
end
