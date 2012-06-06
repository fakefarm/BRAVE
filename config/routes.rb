Brave::Application.routes.draw do

  resources :users
  resources :projects
  resources :agreements
  resources :clients
  resources :sessions
  get "signout" => "sessions#destroy", as: :signout
  root to: "static_pages#index"
  get "about", controller: "static_pages", action: "about"


end
