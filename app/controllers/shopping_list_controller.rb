class ShoppingListController < ApplicationController
  # before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    recipe_food_items = @recipe.recipe_foods.map(&:food)
    inventory_food_items = @inventory.inventory_foods.map(&:food)

    @missing_food_items = recipe_food_items - inventory_food_items
  end

  private

  def calculate_missing_foods(user)
    # logic to calculate missing foods
    # Should show the list of food that is missing for all recipes of the logged-in user (compare the list of food for all recipes with the general food list of that user).
    # Should count the total food items and total price of the missing food.
  end
end