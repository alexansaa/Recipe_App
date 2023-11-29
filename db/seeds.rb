# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Helper method to create a user with inventories, foods, recipes, etc.
def create_user_with_data(name)
  user = User.create!(name: name)

  # Create inventories
  inventory1 = Inventory.create!(name: "Inventory 1", user: user)
  inventory2 = Inventory.create!(name: "Inventory 2", user: user)

  # Create foods
  food1 = Food.create!(name: "Food 1", measurement_unit: "Unit 1", price: 10.99)
  food2 = Food.create!(name: "Food 2", measurement_unit: "Unit 2", price: 20.50)

  # Create recipes
  recipe1 = Recipe.create!(name: "Recipe 1", preparation_time: 30, cooking_time: 60, description: "Delicious recipe", public: true, user: user)
  recipe2 = Recipe.create!(name: "Recipe 2", preparation_time: 45, cooking_time: 40, description: "Another tasty recipe", public: false, user: user)

  # Create associations between foods and inventories
  InventoryFood.create!(inventory: inventory1, food: food1, quantity: 5)
  InventoryFood.create!(inventory: inventory2, food: food2, quantity: 10)

  # Create associations between foods and recipes
  RecipeFood.create!(recipe: recipe1, food: food1, quantity: 2)
  RecipeFood.create!(recipe: recipe2, food: food2, quantity: 3)
end

# Seed data
create_user_with_data("John Doe")
create_user_with_data("Jane Gates")

puts "Seed data successfully created!"

