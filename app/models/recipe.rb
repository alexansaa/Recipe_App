# app/models/recipe.rb

class Recipe < ApplicationRecord
  validates :name, :preparation_time, :cooking_time, :description, presence: true
  belongs_to :user
  has_many :recipe_foods

  attribute :public, :boolean, default: false

  def owner?(current_user)
    # Assuming 'user_id' is the foreign key in the Recipe model
    current_user && user_id == current_user.id
  end

  def toggle_public!
    self.public = !public
    save
  end
end
