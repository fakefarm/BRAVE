Brave::Application.routes.draw do
  resources :users, :projects, :agreements, :clients, :sessions
  get "signout" => "sessions#destroy", as: :signout

  root to: "projects#index"


end
