Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'claims#index', as: :authenticated_root
  end

   devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :orders, only: [ :index, :show, :create, :update, :destroy ]

  get '/order_history', to: 'orders#history', as: :purchasedparts
  resources :order_parts, only: [ :update ]

  resources :claims
    get '/statistic', to: 'claims#statistic', as: :statistic

  resources :parts, only: [:create, :update, :new, :show, :index, :edit]
  get 'my_bought_parts', to: 'parts#my_bought_parts', as: :my_bought_parts
  get 'my_selling_parts', to: 'parts#my_selling_parts', as: :my_selling_parts

end
