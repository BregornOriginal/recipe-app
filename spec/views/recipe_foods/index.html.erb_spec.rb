require 'rails_helper'

RSpec.describe 'recipe_foods/index', type: :view do
  before(:each) do
    assign(:recipe_foods, [
             RecipeFood.create!(
               recipe: nil,
               food: nil,
               quantity: 2
             ),
             RecipeFood.create!(
               recipe: nil,
               food: nil,
               quantity: 2
             )
           ])
  end

  it 'renders a list of recipe_foods' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
  end
end
