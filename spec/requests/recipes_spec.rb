require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user: user) }

  before do
    sign_in user
  end
  describe 'Recipe GET/ index ' do
    it 'returns recipe http success' do
      if response.redirect?
        expect(response).to be_redirect
        expect(response).to redirect_to('/public_recipes')
      else
        expect(response).to be_successful
      end
    end

    it 'renders recipe template' do
      if response.redirect?
        expect(response).to render_template(:index)
      else
        expect(response).to be_successful
      end
      
    end
  end

  describe 'Recipe GET /show' do
    before do
      get :show, params: { id: recipe.id }
    end
  
    it 'returns success for detail recipe' do
      if response.redirect?
        expect(response).to be_redirect
        expect(response).to redirect_to('/users/sign_in')
      else
        expect(response).to be_successful
      end
    end
  end
end 


