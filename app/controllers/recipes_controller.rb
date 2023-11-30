class RecipesController < ApplicationController
  def show
    @recipe = params[:id]
  end

  def destroy
    puts "recipe #{@recipe} should be deleted"
  end
end