class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @inventory = Inventory.find_by_id(params[:inventory_id])

    if @recipe && @inventory
      recipe_food_items = @recipe.recipe_foods.map(&:food)
      inventory_food_items = @inventory.inventory_foods.map(&:food)

      @missing_food_items = recipe_food_items - inventory_food_items
      @total_food_items = @missing_food_items.sum(&:quantity)
      @total_price = @missing_food_items.sum { |food| food.price * food.quantity }
    else
      flash[:error] = 'Recipe or inventory not found.'
      redirect_to root_path
    end
  end
end
