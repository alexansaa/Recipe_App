class Food < ApplicationRecord
  validates :name, :measurement_unit, :price, presence: true

  has_many :recipe_foods, dependent: :destroy
  has_many :inventory_foods, dependent: :destroy
end
