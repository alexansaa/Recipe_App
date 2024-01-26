require 'rails_helper'

RSpec.describe 'Inventories', type: :system do
  let!(:user) { create(:user) }
  let!(:inventory) { create(:inventory) }

  before do
    sign_in user # You might need to define a sign_in helper or use Capybara to sign in
    visit inventories_path
  end

  # it 'displays a list of inventories' do
  #   expect(page).to have_css('h1.head-1', text: 'List of Inventories')
  #   expect(page).to have_css('ul.inventory-list')
  #   expect(page).to have_css('li.inventory-item', count: 1)

  #   within('.inventory-item') do
  #     expect(page).to have_css('.inventory-header h3 a', text: inventory.name)
  #     expect(page).to have_button('Remove')
  #   end
  # end

  # it 'allows removing an inventory', js: true do
  #   accept_confirm do
  #     click_button('Remove')
  #   end

  #   expect(page).to have_content('Inventory removed successfully.') # Assuming a flash message is shown
  #   expect(page).not_to have_css('li.inventory-item')
  # end

  # it 'displays a message when there are no inventories' do
  #   Inventory.destroy_all # Assuming there are no inventories left
  #   visit inventories_path

  #   expect(page).to have_content('There are no inventories.')
  # end
end
