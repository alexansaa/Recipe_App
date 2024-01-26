require 'rails_helper'

RSpec.describe 'Creating a new inventory', type: :system do
  let!(:user) { create(:user) }

  before do
    sign_in user # You might need to define a sign_in helper or use Capybara to sign in
    visit new_inventory_path
  end

  # it 'allows creating a new inventory' do
  #   fill_in 'Name', with: 'New Inventory Name' # Assuming the field is named 'Name' in the form
  #   click_button 'Create Inventory'

  #   expect(page).to have_content('Inventory created successfully.') # Assuming a flash message is shown
  #   expect(page).to have_content('New Inventory Name') # Verify the new inventory appears on the page
  # end

  # it 'allows navigating back to inventories' do
  #   click_link 'Back to Inventories'

  #   expect(page).to have_current_path(inventories_path)
  # end
end
