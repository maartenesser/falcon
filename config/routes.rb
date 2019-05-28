Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get '/claims/new', to: 'claims#create'
end
