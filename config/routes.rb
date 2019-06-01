Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'claims#index', as: :authenticated_root
  end

   devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :orders, only: [ :index, :show, :create, :update, :destroy]

  resources :order_parts, only: [ :update ]

  resources :claims

  get '/statistic', to: 'claims#statistic', as: :statistic

  resources :parts, only: [:create, :update, :new, :show, :index, :edit]
end
