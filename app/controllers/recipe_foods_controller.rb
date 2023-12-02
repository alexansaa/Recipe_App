class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.new(food_id: params[:recipe_food][:food_id], quantity: params[:recipe_food][:quantity])
    if @recipe_food.save
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Recipe Food was successfully created.'
    else
      render :new, notice: 'Please try again'
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.destroy
    redirect_to recipe_path(@recipe_food.recipe_id)
  end

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id, :recipe_id)
  end
end