Brave::Application.routes.draw do
  resources :users, :projects, :agreements, :clients, :sessions
  get "signout" => "sessions#destroy", as: :signout

  root to: "projects#index"
  # get "clients/index"
  # 
  #   get "clients/new"
  # 
  #   get "clients/edit"
  # 
  #   get "clients/show"
  # 
  #   get "agreements/index"
  # 
  #   get "agreements/new"
  # 
  #   get "agreements/edit"
  # 
  #   get "agreements/show"
  # 
  #   get "projects/index"
  # 
  #   get "projects/new"
  # 
  #   get "projects/edit"
  # 
  #   get "projects/show"
  # 
  #   get "users/index"
  # 
  #   get "users/new"
  # 
  #   get "users/edit"
  # 
  #   get "users/show"

end
