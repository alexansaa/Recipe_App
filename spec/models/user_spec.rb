require 'rails_helper'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = build(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a name' do
    user = build(:user, name: nil)
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
