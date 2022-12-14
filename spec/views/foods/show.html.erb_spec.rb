require 'rails_helper'

RSpec.describe 'foods/show', type: :view do
  before(:each) do
    @food = assign(:food, Food.create!(
                            user: nil,
                            name: 'Name',
                            measurement_unit: 'Measurement Unit',
                            price: 2,
                            quantity: 3
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Measurement Unit/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
