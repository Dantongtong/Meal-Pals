Given /the following restaurants exist/ do |restaurants_table|
  restaurants_table.hashes.each do |restaurant|
    Restaurant.create(restaurant)
  end
end

# remove ^ try it
When /^(?:|I )press "([^"]*)" with the id of "([^"]*)"$/ do |button, id|
  #click_button(id.parameterize.underscore)
  find("#"+id.parameterize.underscore+"_"+button).click
end

Then /(.*) restaurants should exist/ do | n_restaurants |
  expect(Restaurant.count).to eq n_restaurants.to_i
end

Then /^the rating of "(.*)" should be "(.*)"/ do |restaurant_name, rating|
  restaurant = Restaurant.find_by(name: restaurant_name)
  expect(restaurant.rating).to eq(rating)
end


#ruby regular experssion