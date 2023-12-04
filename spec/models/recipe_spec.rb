require 'rails_helper'

RSpec.describe Recipe, type: :model do
  it 'is valid with valid attributes' do
    recipe = Recipe.new(
      name: 'Example Recipe',
      preparation_time: 30,
      cooking_time: 45,
      description: 'This is a test recipe',
      user: User.new
    )
    expect(recipe).to be_valid
  end

  it 'is not valid without a name' do
    recipe = Recipe.new(name: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a preparation_time' do
    recipe = Recipe.new(preparation_time: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a cooking_time' do
    recipe = Recipe.new(cooking_time: nil)
    expect(recipe).to_not be_valid
  end

  it 'is not valid without a description' do
    recipe = Recipe.new(description: nil)
    expect(recipe).to_not be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many recipe_foods' do
    association = described_class.reflect_on_association(:recipe_foods)
    expect(association.macro).to eq(:has_many)
  end
end
