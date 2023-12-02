require 'rails_helper'

RSpec.describe 'Inventory details page', type: :system do
  let!(:user) { create(:user) }
  let!(:inventory) { create(:inventory) }
  let!(:food) { create(:food) }
  let!(:inventory_food) { create(:inventory_food, inventory:, food:) }

  before do
    sign_in user # Assuming you have a sign_in helper method
    visit inventory_path(inventory)
  end

  # it 'displays inventory details and associated foods' do
  #   expect(page).to have_content(inventory.name)

  #   within '.items_table' do
  #     expect(page).to have_content(food.name)
  #     expect(page).to have_content(inventory_food.quantity)
  #     expect(page).to have_link('Remove', href: inventory_inventory_food_path(inventory, inventory_food), visible: :all)
  #   end
  # end

  # it 'allows navigating back to inventories' do
  #   click_link 'Back to Inventories'

  #   expect(page).to have_current_path(inventories_path)
  # end

  # it 'allows adding a new food to the inventory' do
  #   click_link 'Add food'

  #   # Fill in the form with food details
  #   fill_in 'Quantity', with: 10 # Assuming there's a field 'Quantity' for the food

  #   click_button 'Create Food'

  #   expect(page).to have_content('Food added successfully.') # Adjust to the flash message you display
  #   within '.items_table' do
  #     expect(page).to have_content('New Food Name') # Adjust to the newly added food name
  #     expect(page).to have_content('10') # Adjust to the quantity added
  #   end
  # end

  # it 'allows removing a food from the inventory' do
  #   within '.items_table' do
  #     click_link 'Remove'
  #   end

  #   expect(page).not_to have_content(food.name) # Verify the removed food does not appear
  # end
end
