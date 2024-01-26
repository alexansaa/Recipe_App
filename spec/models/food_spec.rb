require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99
    )
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    food = Food.new(measurement_unit: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(price: nil)
    expect(food).to_not be_valid
  end

  it 'has many recipe_foods' do
    association = described_class.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many inventory_foods' do
    association = described_class.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end

  it 'destroys associated recipe_foods when destroyed' do
    food = Food.create(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99
    )

    recipe_food = food.recipe_foods.create
    expect(RecipeFood.find_by(id: recipe_food.id)).to be_nil
  end

  it 'destroys associated inventory_foods when destroyed' do
    food = Food.create(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99
    )

    inventory_food = food.inventory_foods.create
    food.destroy
    expect(InventoryFood.find_by(id: inventory_food.id)).to be_nil
  end
end
