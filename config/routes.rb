Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :inventories, only: [:show] do
    resources :inventory_foods, only: [:destroy, :new, :create]
  end

  resources :food, only: [:new]
  resources :recipes, only: [:show]

  get '/inventories', to: 'inventories#index', as: 'inventories'
  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'

  # Route for displaying public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Route for editing user profile
  get '/edit_user_registration', to: 'users#edit', as: 'edit_user_registration'

  # Route for destroying user session (logging out)
  delete '/destroy_user_session', to: 'sessions#destroy', as: 'destroy_user_session'
  # Defines the root path route ("/")
  # root "posts#index"
end
