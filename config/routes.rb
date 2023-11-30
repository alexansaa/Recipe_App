Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :recipes
  get '/inventories', to: 'inventories#index', as: 'inventories'

  # Route for displaying foods
  get '/foods', to: 'foods#index', as: 'foods'

  # Route for displaying public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Route for editing user profile
  get '/edit_user_registration', to: 'users#edit', as: 'edit_user_registration'

  # Route for destroying user session (logging out)
  delete '/destroy_user_session', to: 'sessions#destroy', as: 'destroy_user_session'
  # Defines the root path route ("/")
  # root "posts#index"
end
