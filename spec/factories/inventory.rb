# spec/factories/inventory_foods.rb

FactoryBot.define do
  factory :inventory_food do
    quantity { Faker::Number.between(from: 1, to: 100) }
    association :inventory
    association :food
  end
end
