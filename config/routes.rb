Prana::Application.routes.draw do
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :yoga_classes
  resources :sessions,      only: [:new, :create, :destroy]
  resources :microposts,    only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
  root to: 'static_pages#home'
  match '/rates',   to: 'static_pages#rates',    via: 'get'
  match '/signup',  to: 'users#new',             via: 'get'
  match '/signin',  to: 'sessions#new',          via: 'get'
  match '/signout', to: 'sessions#destroy',      via: 'delete'
  match '/about',   to: 'static_pages#about',    via: 'get'
  match '/instructors', to: 'users#instructors', via: 'get'
end
