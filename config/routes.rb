Rails.application.routes.draw do

  # resources :users, only: [:new, :show]

  # get "/user/new"
  get "/pages", to: "pages#index"
  get "/pages/analytics", to: "pages#analytics"
  # get "/pages/:page" => "pages#show"

  get "/", to: "sessions#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/users/:id", to: "users#show", as: "user"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"

  resources :jobs, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update]
end
