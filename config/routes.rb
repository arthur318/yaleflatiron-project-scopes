Rails.application.routes.draw do
  get 'tags/new'
  get 'tags/edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :jobs, only: [:index, :show]
  resources :tags, only: [:index, :show, :new, :create, :edit, :update]
end
