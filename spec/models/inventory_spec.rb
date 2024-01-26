require 'rails_helper'

RSpec.describe Inventory, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(name: 'Test User')
    inventory = Inventory.new(
      name: 'Example Inventory',
      user:
    )
    expect(inventory).to be_valid
  end

  it 'is not valid without a name' do
    user = User.create(name: 'Test User')
    inventory = Inventory.new(name: nil, user:)
    expect(inventory).to_not be_valid
  end

  it 'belongs to a user' do
    association = described_class.reflect_on_association(:user)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many inventory_foods' do
    association = described_class.reflect_on_association(:inventory_foods)
    expect(association.macro).to eq(:has_many)
  end
end
