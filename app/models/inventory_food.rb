class InventoryFood < ApplicationRecord
  belongs_to :inventory
  belongs_to :food

  validates :quantity, numericaly: { only_integer: true, greater_than_or_equal_to: 0 }
end
