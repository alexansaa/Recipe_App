class Food < ApplicationRecord
  validates :name, :measurement_unit, :price, presence: true
  has_many :recipe_foods, dependent: :destroy
  has_many :recipes, through: :recipe_foods
  has_many :inventory_foods
  has_many :inventories, through: :inventory_foods
end
