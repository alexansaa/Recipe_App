class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!, except: [:show]
  before_action :set_recipe, only: [:show, :destroy]

  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
    @recipe_foods = RecipeFood.includes([:food]).where(recipe: @recipe)
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
    if @recipe.update(recipe_params)
      respond_to do |format|
        format.html { redirect_to @recipe }
      end
    else
      puts "it's not updated"
    end
  end


  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
