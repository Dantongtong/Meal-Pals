require 'rails_helper'

RSpec.describe "restaurants/edit", type: :view do
  before(:each) do
    @restaurant = assign(:restaurant, Restaurant.create!(
      :name => "MyString",
      :type => "",
      :of => "MyString",
      :food => "MyString",
      :rating => "MyString",
      :address => "MyString",
      :details => "MyString"
    ))
  end

  it "renders the edit restaurant form" do
    render

    assert_select "form[action=?][method=?]", restaurant_path(@restaurant), "post" do

      assert_select "input#restaurant_name[name=?]", "restaurant[name]"

      assert_select "input#restaurant_type[name=?]", "restaurant[type]"

      assert_select "input#restaurant_of[name=?]", "restaurant[of]"

      assert_select "input#restaurant_food[name=?]", "restaurant[food]"

      assert_select "input#restaurant_rating[name=?]", "restaurant[rating]"

      assert_select "input#restaurant_address[name=?]", "restaurant[address]"

      assert_select "input#restaurant_details[name=?]", "restaurant[details]"
    end
  end
end
