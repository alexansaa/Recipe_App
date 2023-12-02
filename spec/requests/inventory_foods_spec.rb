# require 'rails_helper'

# RSpec.describe InventoryFoodsController, type: :controller do
#   let(:inventory) { Inventory.create(name: 'Test Inventory') }
#   let(:food) { Food.create(name: 'Test Food') }
#   let(:valid_params) do
#     {
#       inventory_id: inventory.id,
#       post: { food_id: food.id, quantity: 5 }
#     }
#   end

#   describe 'GET #new' do
#     it 'returns a success response' do
#       get :new, params: { inventory_id: inventory.id }
#       expect(response).to be_successful
#     end

#     it 'assigns the requested inventory as @inventory' do
#       get :new, params: { inventory_id: inventory.id }
#       expect(assigns(:inventory)).to eq(inventory)
#     end

#     it 'assigns all foods as @food' do
#       get :new, params: { inventory_id: inventory.id }
#       expect(assigns(:food)).to eq(Food.all)
#     end

#     it 'assigns a new inventory_food as @inventory_food' do
#       get :new, params: { inventory_id: inventory.id }
#       expect(assigns(:inventory_food)).to be_a_new(InventoryFood)
#     end
#   end

#   describe 'POST #create' do
#     it 'creates a new InventoryFood' do
#       expect do
#         post :create, params: valid_params
#       end.to change(InventoryFood, :count).by(1)
#     end

#     it 'redirects to the inventory path' do
#       post :create, params: valid_params
#       expect(response).to redirect_to(inventory_path(id: inventory.id))
#     end

#     it 'sets flash success message on successful creation' do
#       post :create, params: valid_params
#       expect(flash[:success]).to eq('Inventory Food created succesfully')
#     end

#     # Add more tests to cover scenarios for invalid data and error handling
#   end

#   describe 'DELETE #destroy' do
#     let!(:inventory_food) { InventoryFood.create(inventory: inventory, food: food, quantity: 5) }

#     it 'destroys the requested inventory_food' do
#       expect do
#         delete :destroy, params: { id: inventory_food.id }
#       end.to change(InventoryFood, :count).by(-1)
#     end

#     it 'redirects to the inventory path' do
#       delete :destroy, params: { id: inventory_food.id }
#       expect(response).to redirect_to(inventory_path(id: inventory.id))
#     end

#     it 'sets flash success message on successful deletion' do
#       delete :destroy, params: { id: inventory_food.id }
#       expect(flash[:success]).to eq('Inventory Food deleted succesfully')
#     end

#     # Add more tests to cover scenarios for error handling
#   end
# end
