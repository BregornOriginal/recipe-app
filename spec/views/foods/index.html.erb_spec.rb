require 'rails_helper'

RSpec.describe 'foods/index', type: :view do
  before(:each) do
    assign(:foods, [
             Food.create!(
               user: nil,
               name: 'Name',
               measurement_unit: 'Measurement Unit',
               price: 2,
               quantity: 3
             ),
             Food.create!(
               user: nil,
               name: 'Name',
               measurement_unit: 'Measurement Unit',
               price: 2,
               quantity: 3
             )
           ])
  end

  it 'renders a list of foods' do
    render
    assert_select 'tr>td', text: nil.to_s, count: 2
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Measurement Unit'.to_s, count: 2
    assert_select 'tr>td', text: 2.to_s, count: 2
    assert_select 'tr>td', text: 3.to_s, count: 2
  end
end
