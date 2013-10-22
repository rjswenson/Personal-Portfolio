Portfolio::Application.routes.draw do

  # get "signup", to: 'users#new', as: 'signup'
  # get "login", to: 'sessions#new', as: 'login'
  # get "logout", to: 'sessions#destroy', as: 'logout'

  devise_for :users

  resources :posts do
    resources :comments
  end

  resources :projects

  root to: 'static_pages#index'

  match "*unmatched_route", to: "application"
end
