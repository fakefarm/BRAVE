Brave::Application.routes.draw do
  resources :users, :projects, :agreements, :clients, :sessions
  get "signout" => "sessions#destroy", as: :signout

  root to: "static_pages#index"
  get "about", controller: "static_pages", action: "about"


end
