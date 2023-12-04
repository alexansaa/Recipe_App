require 'rails_helper'

RSpec.describe 'recipes/index', type: :view do
  context 'when there are recipes' do
    let(:recipe1) { create(:recipe, name: 'Recipe 1', description: 'Description 1') }
    let(:recipe2) { create(:recipe, name: 'Recipe 2', description: 'Description 2') }
    let(:user) { create(:user) }
    before do
      recipe1
      recipe2
      assign(:recipes, [recipe1, recipe2])
      allow(view).to receive(:can?).and_return(true)
      allow(view).to receive(:current_user).and_return(user)
      render
    end
    it 'displays a link to create a new recipe' do
      expect(rendered).to have_link('New Recipe', href: new_recipe_path)
    end
  end
  context 'when there are no recipes' do
    before do
      assign(:recipes, [])
      render
    end

    it 'displays a message when there are no recipes' do
      expect(rendered).to have_selector('p.recipe-empty', text: 'There are no recipes.')
    end

    it 'displays a link to create a new recipe' do
      expect(rendered).to have_link('New Recipe', href: new_recipe_path)
    end
  end
end
