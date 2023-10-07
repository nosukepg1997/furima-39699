Rails.application.routes.draw do
  devise_for :users
  get 'items/index'
  get 'users/items'
  post 'users', to: 'devise/registrations#create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "items#index"

  resources :users, only: [:show, :edit, :update]
end
