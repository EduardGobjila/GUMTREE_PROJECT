Rails.application.routes.draw do
  get 'users/new'
  get 'users/update'
  get 'users/edit'
  get 'users/show'
  get 'users/create'
  get 'users/destroy'
  get 'items/index'
  get 'items/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root to: "pages#home"
  resources :items
end
