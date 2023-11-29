class RecipesController < ApplicationController
  def show
    @recipe = params[:id]
  end
end