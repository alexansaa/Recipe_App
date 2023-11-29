class RecipesController < ApplicationController
<<<<<<< HEAD
end
=======
  def show
    @recipe = params[:id]
  end

  def destroy
    puts "recipe #{@recipe} should be deleted"
  end
end
>>>>>>> 40f60c7 (redirecting to detailed recipe)
