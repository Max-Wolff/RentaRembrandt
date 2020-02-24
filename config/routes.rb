Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # rout for current user
  get '/dashboard', to: 'pages#dashboard', as: :dashboard

  resources :paintings
  resources :bookings, only: [:index, :show, :destroy]

  resources :paintings, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
end
