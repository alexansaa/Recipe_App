RSpec.describe RecipesController, type: :controller do
    describe 'PATCH #update' do
      context 'when the recipe owner updates the recipe' do
        it 'updates the recipe and redirects to the recipe page' do
          user = create(:user)
          recipe = create(:recipe, user: user)
          sign_in user
  
          patch :update, params: { id: recipe.id, recipe: { public: true } }
  
          expect(response).to redirect_to(recipe_path(recipe))
          expect(assigns(:recipe).public).to eq(true)
        end
      end
  
      context 'when a non-owner tries to update the recipe' do
        it 'does not update the recipe and redirects to the root page' do
          user = create(:user)
          recipe = create(:recipe)
          sign_in user
  
          patch :update, params: { id: recipe.id, recipe: { public: true } }
  
          expect(response).to redirect_to(root_path)
          expect(assigns(:recipe).public).to eq(false)
        end
      end
    end
  end
  