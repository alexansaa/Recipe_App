Rails.application.routes.draw do
  # Route for displaying recipes
  get '/recipes', to: 'recipes#index', as: 'recipes'

  # Route for displaying inventories
  get '/inventories', to: 'inventories#index', as: 'inventories'

  # Route for displaying foods
  get '/foods', to: 'foods#index', as: 'foods'

  # Route for displaying public recipes
  get '/public_recipes', to: 'public_recipes#index', as: 'public_recipes'

  # Route for editing user profile
  get '/edit_user_registration', to: 'users#edit', as: 'edit_user_registration'

  # Route for destroying user session (logging out)
  delete '/destroy_user_session', to: 'sessions#destroy', as: 'destroy_user_session'
end
