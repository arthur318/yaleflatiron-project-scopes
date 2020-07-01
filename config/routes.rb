Rails.application.routes.draw do

  # resources :users, only: [:new, :show]

  # get "/user/new"
  get "/", to: "sessions#new"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :jobs, only: [:index, :show]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update]
end
