Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :claims, only: [:new, :create, :show, :index, :edit, :destroy, :update]
  resources :parts, only: [:create, :update, :new]

end
