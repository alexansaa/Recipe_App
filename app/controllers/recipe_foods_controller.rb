# app/controllers/recipe_foods_controller.rb
class RecipeFoodsController < ApplicationController
  before_action :find_recipe

  def create
    @food = Food.find(params[:food_id])
    @recipe.foods << @food unless @recipe.foods.include?(@food)
    redirect_to @recipe, notice: 'Food added to recipe successfully.'
  end

  def destroy
    @food = Food.find(params[:id])
    @recipe.foods.delete(@food)
    redirect_to @recipe, notice: 'Food removed from recipe successfully.'
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
