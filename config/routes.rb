Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  
  root "recipes#index"
  get "up" => "rails/health#show", as: :rails_health_check

  get '/shopping_list', to: 'shopping_list#index', as: 'shopping_list'

  resources :recipes, only: [:show, :new]
  resources :inventories, only: [:show]
end
