class ShoppingListController < ApplicationController
  # before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    recipe_food_items = @recipe.recipe_foods.map(&:food)
    inventory_food_items = @inventory.inventory_foods.map(&:food)

    @missing_food_items = recipe_food_items - inventory_food_items
  end
end
