class PublicRecipesController < ApplicationController
  def index
    # @public_recipes = Recipe.order(created_at: :desc).all
    @public_recipes = Recipe.where(public: true).order(created_at: :desc)
  end
end
