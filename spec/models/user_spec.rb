require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(name: 'Example User')
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil)
    expect(user).to_not be_valid
  end

  it 'has many inventories' do
    association = described_class.reflect_on_association(:inventories)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many recipes' do
    association = described_class.reflect_on_association(:recipes)
    expect(association.macro).to eq(:has_many)
  end
end
