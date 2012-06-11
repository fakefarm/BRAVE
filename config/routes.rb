Brave::Application.routes.draw do

  # get "votes/new" => "votes#new"
  # 
  #   post "votes/create" => "votes#create", as: :votes_url
  # 
  #   get "votes/delete" => "votes#destroy"
  resources :votes
  resources :users
  resources :projects
  resources :agreements
  resources :clients
  resources :sessions
  get "signout" => "sessions#destroy", as: :signout
  root to: "static_pages#index"
  get "about", controller: "static_pages", action: "about"


end
