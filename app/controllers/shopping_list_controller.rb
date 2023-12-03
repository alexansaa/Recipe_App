class ShoppingListController < ApplicationController
  before_action :authenticate_user!

  def index
    @recipe = Recipe.find(params[:recipe_id])
    @inventory = Inventory.find(params[:inventory_id])

    if @recipe && @inventory
      recipe_food_items = @recipe.recipe_foods
      inventory_food_items = @inventory.inventory_foods

      @missing_food_items = recipe_food_items - inventory_food_items

      @total_food_items = 0
      @total_price = 0
      @missing_food_items.each do |item|
        @total_food_items += item.quantity
        @total_price += Food.find(item.food_id).price
      end

    else
      flash[:error] = 'Recipe or inventory not found.'
      redirect_to root_path
    end
  end

  def default
    @recipes = current_user.recipes
    @recipes_food = []
    @recipes.each do |item|
      @recipes_food += item.recipe_foods
    end

    @inventories = current_user.inventories
    @inventories_food = []
    @inventories.each do |item|
      @inventories_food += item.inventory_foods
    end

    @missing_food_items = @recipes_food - @inventories_food

  end
end
