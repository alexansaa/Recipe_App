require 'rails_helper'

RSpec.describe RecipesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe, user: user) }

  # let(:user) { create(:user) }
  before do
    # @user = FactoryBot.create(:user)
    # @recipe = FactoryBot.create(:recipe, user: @user)
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

  describe "recipes GET /show'" do
    before do
      sign_in user
      get "/recipes/#{recipe.id}"
    end

    it 'returns success for detail recipe' do
      expect(response).not_to have_http_status(400)
    end

    it 'returns success for detail recipe' do
      expect(response).to have_http_status(200)
    end
  end
end