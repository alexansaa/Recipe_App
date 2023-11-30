require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  it 'is valid with valid attributes' do
    recipe_food = RecipeFood.new(
      quantity: 2,
      recipe: Recipe.new,
      food: Food.new(
        name: 'Example Food',
        measurement_unit: 'Grams',
        price: 10.99
      )
    )
    expect(recipe_food).to be_valid
  end

  it 'is not valid without a quantity' do
    recipe_food = RecipeFood.new(quantity: nil)
    expect(recipe_food).to_not be_valid
  end

  it 'is not valid with a non-integer quantity' do
    recipe_food = RecipeFood.new(quantity: 2.5)
    expect(recipe_food).to_not be_valid
  end

  it 'belongs to a recipe' do
    association = described_class.reflect_on_association(:recipe)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    association = described_class.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end
