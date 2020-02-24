Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :new, :create] do
    resources :paintings
    resources :bookings, only: [:index, :show, :destroy]
  end
  resources :paintings, only: [:index, :show] do
    resources :bookings, only: [:new, :create]
  end
end
