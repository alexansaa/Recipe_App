class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show]
  before_action :set_recipe, only: %i[show destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @recipe_foods = @recipe.recipe_foods
    @inventories = Inventory.all
    @foods = Food.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def update
    @recipe = Recipe.find(params[:id])
    return unless @recipe.update(recipe_params)

    redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.'
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
