# require 'rails_helper'

# RSpec.describe RecipesController, type: :controller do
#   let(:user) { User.create(name: 'test_user', email: 'test@example.com', password: 'password') }
#   let(:recipe_params) do
#     {
#       name: 'Test Recipe',
#       preparation_time: 10,
#       cooking_time: 20,
#       description: 'This is a test recipe',
#       public: true
#     }
#   end

#   before do
#     sign_in user
#   end

#   describe 'GET #index' do
#     it 'returns a success response' do
#       get :index
#       expect(response).to be_successful
#     end

#     it 'assigns all recipes as @recipes' do
#       recipe = Recipe.create!(recipe_params)
#       get :index
#       expect(assigns(:recipes)).to eq([recipe])
#     end
#   end

#   describe 'GET #show' do
#     it 'returns a success response' do
#       recipe = Recipe.create!(recipe_params)
#       get :show, params: { id: recipe.to_param }
#       expect(response).to be_successful
#     end

#     it 'assigns the requested recipe as @recipe' do
#       recipe = Recipe.create!(recipe_params)
#       get :show, params: { id: recipe.to_param }
#       expect(assigns(:recipe)).to eq(recipe)
#     end
#   end

#   describe 'GET #new' do
#     it 'returns a success response' do
#       get :new
#       expect(response).to be_successful
#     end

#     it 'assigns a new recipe as @recipe' do
#       get :new
#       expect(assigns(:recipe)).to be_a_new(Recipe)
#     end
#   end

#   describe 'POST #create' do
#     context 'with valid params' do
#       it 'creates a new Recipe' do
#         expect do
#           post :create, params: { recipe: recipe_params }
#         end.to change(Recipe, :count).by(1)
#       end

#       it 'redirects to the created recipe' do
#         post :create, params: { recipe: recipe_params }
#         expect(response).to redirect_to(Recipe.last)
#       end
#     end

#     # Add tests to handle scenarios with invalid params and error handling
#   end

#   describe 'DELETE #destroy' do
#     it 'destroys the requested recipe' do
#       recipe = Recipe.create!(recipe_params)
#       expect do
#         delete :destroy, params: { id: recipe.to_param }
#       end.to change(Recipe, :count).by(-1)
#     end

#     it 'redirects to the recipes list' do
#       recipe = Recipe.create!(recipe_params)
#       delete :destroy, params: { id: recipe.to_param }
#       expect(response).to redirect_to(recipes_url)
#     end
#   end
# end
