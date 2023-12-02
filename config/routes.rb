Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root "recipes#index"
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :inventories, only: [:index, :show, :new, :create] do
    resources :inventory_foods, only: [:destroy, :new, :create]
  end

  resources :foods, only: [:new, :create]
  resources :recipes, only: [:index, :show, :destroy, :new, :update, :create] do
    resources :recipe_foods, only: [:destroy, :update, :new, :create]
  end

  resources :shopping_list, only: [:index]


  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Defines the root path route ("/")
  # root "posts#index"
end
