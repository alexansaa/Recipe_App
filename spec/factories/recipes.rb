# spec/factories/recipes.rb

FactoryBot.define do
  factory :recipe do
    name { Faker::Name.name }
    preparation_time { 2.5 }
    cooking_time { 3.5 }
    description { 'Your Recipe Description' }
    public { true }
    user
  end
end
