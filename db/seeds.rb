# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# add user test data
User.create([{ email: 'test@columbia.edu', password: '123', username: 'John', email_confirmed: true }])
User.create([{ email: 'test1@columbia.edu', password: '123', username: 'Stacy', email_confirmed: true }])
User.create([{ email: 'admin@columbia.edu', password: '123', username: 'admin', email_confirmed: true, is_admin: true }])


restaurants = [
  {name: 'Shake Shack', rating: 4, address: '2957 Broadway', details: "Shake Shack Inc (Shake Shack) is a fast-food restaurant operator. The company's menu includes burgers, chicken bites, crinkle-cut fries, hot dogs, shakes and frozen custard, Abita root beer, shack-made lemonade, organic fresh brewed iced tea, and organic apple juice."},
  {name: "JJ's Place", rating: 3, address: 'lower level of John Jay Hall', details: "JJ's Place is the casual and comfortable weekend and late-night destination! Featuring an Angus Steak Burger and other specialty sandwiches plus fries, wings, smoothies, and more."},
  {name: 'Dun Huang', rating: 3, address: '1268 Amsterdam Ave', details: "As No. 1 hand pulled noodles dish in the city, Dunhuang has the most authentic northwest Chinese cuisine. We are famous for our proud Lanzhou hand pulled beef noodles, fantastic lamb meal and BBQ."},
  {name: 'Sweetgreen', rating: 3, address: '2937 Broadway', details: 'Fresh salads, plates + grain bowls available for pickup and delivery every day, made in-house from scratch, using whole produce delivered that morning.'},
]

restaurants.each do |restaurant|
  Restaurant.create!(restaurant)
end


reviews = [
  { restaurant_id: 1, user_id: 1, rating: 1, comment: 'Bad food.' },
  { restaurant_id: 1, user_id: 2, rating: 5, comment: 'Good food.' },
]

reviews.each do |review|
  Review.create!(review)
end

timeslots = [
  { restaurant_id: 1, user_id: 1, start_time: '2022-10-11 12:37:00', max_number: 6 },
  { restaurant_id: 2, user_id: 1, start_time: '2022-12-11 00:00:00', max_number: 6 }, 
  { restaurant_id: 3, user_id: 2, start_time: '2002-10-19 14:43:00', max_number: 6 }, 
]

timeslots.each do |timeslot|
  Timeslot.create!(timeslot)
end

guests = [
  { timeslot_id: 3, user_id: 1 },
  { timeslot_id: 1, user_id: 2 },
]

guests.each do |guest|
  Guest.create!(guest)
end

