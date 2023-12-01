class PublicRecipesController < ApplicationController
  def index
    @public_recipes = Recipe.order(created_at: :desc).all
  end
end
