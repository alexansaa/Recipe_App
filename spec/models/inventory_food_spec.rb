require 'rails_helper'

RSpec.describe InventoryFood, type: :model do
  let(:user) { User.create(name: 'Test User') }

  it 'is valid with valid attributes' do
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.99
    )
    inventory_food = InventoryFood.new(
      quantity: 5,
      inventory: Inventory.new(user:),
      food:
    )
    expect(inventory_food).to be_valid
  end

  it 'is not valid without a quantity' do
    inventory_food = InventoryFood.new(quantity: nil)
    expect(inventory_food).to_not be_valid
  end

  it 'is not valid with a non-integer quantity' do
    inventory_food = InventoryFood.new(quantity: 5.5)
    expect(inventory_food).to_not be_valid
  end

  it 'is not valid with a negative quantity' do
    inventory_food = InventoryFood.new(quantity: -5)
    expect(inventory_food).to_not be_valid
  end

  it 'belongs to an inventory' do
    association = described_class.reflect_on_association(:inventory)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'belongs to a food' do
    association = described_class.reflect_on_association(:food)
    expect(association.macro).to eq(:belongs_to)
  end
end
