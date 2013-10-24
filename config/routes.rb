Portfolio::Application.routes.draw do

  # get "signup", to: 'users#new', as: 'signup'
  # get "login", to: 'sessions#new', as: 'login'
  # get "logout", to: 'sessions#destroy', as: 'logout'

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}


  resources :posts do
    resources :comments
  end

  resources :projects do
    resources :comments
  end

  root to: 'static_pages#index'
end
