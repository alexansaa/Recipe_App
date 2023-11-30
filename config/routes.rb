Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root "recipes#index"
  get "up" => "rails/health#show", as: :rails_health_check

  resources :inventories, only: [:show] do
    resources :inventory_foods, only: [:destroy, :new, :create]
  end

  resources :recipes, only: [:show, :new]
  resources :food, only: [:new]

  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'

  # Defines the root path route ("/")
  # root "posts#index"
end
