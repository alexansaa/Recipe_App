Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root "recipes#index"
  # get "up" => "rails/health#show", as: :rails_health_check
  resources :inventories, only: [:index, :show, :new] do
    resources :inventory_foods, only: [:destroy, :new, :create]
  end

  resources :food, only: [:new]

  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'
  # Users routes
  resources :recipes, only: [:index, :show, :destroy, :new]

  # Route for displaying public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Route for editing user profile
  # get '/edit_user_registration', to: 'users#edit', as: 'edit_user_registration'

  # Route for destroying user session (logging out)
  # delete '/destroy_user_session', to: 'sessions#destroy', as: 'destroy_user_session'
  # Defines the root path route ("/")
  # root "posts#index"
end
