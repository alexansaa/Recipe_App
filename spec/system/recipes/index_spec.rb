RSpec.describe "recipes/index.html.erb", type: :view do
  include Devise::Test::ControllerHelpers 
  before(:each) do
    assign(:recipes, [
      create(:recipe, name: "Recipe 1", description: "Description 1"),
      create(:recipe, name: "Recipe 2", description: "Description 2")
    ])
  end

  it "renders a list of recipes" do
    render
    expect(rendered).to have_selector('h1.head-1', text: 'List of Recipes')
    expect(rendered).to have_selector('ul.recipe-list') do |ul|
      expect(ul).to have_selector('li.recipe-item', count: 2)
      expect(ul).to have_selector('li.recipe-item') do |li|
        expect(li).to have_selector('h3 a', text: 'Recipe 1')
        expect(li).to have_selector('p', text: 'Description 1')
        expect(li).to have_selector('h3 a', text: 'Recipe 2')
        expect(li).to have_selector('p', text: 'Description 2')
        expect(li).to have_selector('input[type="submit"][value="Remove"]', count: 2)
      end
    end
    expect(rendered).to have_selector('p.recipe-empty', text: 'There are no recipes.')
    expect(rendered).to have_link('New Recipe', href: new_recipe_path, class: 'new-recipe-button')
  end
end
