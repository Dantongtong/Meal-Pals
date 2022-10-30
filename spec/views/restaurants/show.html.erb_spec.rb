require 'rails_helper'

RSpec.describe "restaurants/show", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "Name",
      :type => "Type",
      :of => "Of",
      :food => "Food",
      :rating => "Rating",
      :address => "Address",
      :details => "Details"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/Of/)
    expect(rendered).to match(/Food/)
    expect(rendered).to match(/Rating/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Details/)
  end
end
