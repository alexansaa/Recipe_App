# require 'rails_helper'

# RSpec.describe ShoppingListController, type: :controller do
#   let(:recipe) { Recipe.create(name: 'Test Recipe') }
#   let(:inventory) { Inventory.create(name: 'Test Inventory') }
#   let(:food1) { Food.create(name: 'Ingredient 1') }
#   let(:food2) { Food.create(name: 'Ingredient 2') }

#   before do
#     recipe.recipe_foods.create(food: food1)
#     inventory.inventory_foods.create(food: food1)
#   end

#   describe 'GET #index' do
#     it 'assigns required variables and calculates missing food items' do
#       get :index, params: { recipe_id: recipe.id, inventory_id: inventory.id }

#       expect(assigns(:recipe)).to eq(recipe)
#       expect(assigns(:inventory)).to eq(inventory)

#       missing_food_items = assigns(:missing_food_items)
#       expect(missing_food_items).to be_an(Array)
#       expect(missing_food_items).to include(food2) # Assuming food2 is part of the recipe but not inventory
#     end
#   end
# end
