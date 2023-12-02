# spec/factories/recipes.rb

FactoryBot.define do
    factory :recipe do
      name { 'Your Recipe Name' }
      preparation_time { 2.5 }
      cooking_time { 3.5 }
      description { 'Your Recipe Description' }
      public { true }
      user
  
      # Define any other attributes needed for your Recipe model
    end
  end
  