# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# add user test data
User.create([{ email: 'test@columbia.edu', password: '123', username: 'test', email_confirmed: true }])
User.create([{ email: 'admin@columbia.edu', password: '123', username: 'admin', email_confirmed: true, is_admin: true }])


restaurants = [
  {name: 'Shake Shack', rating: 4, address: 'Unkown', details: 'Unknown'},
  {name: 'J&J', rating: 3, address: 'Unkown', details: 'Unknown'},
  {name: 'Dun Huang', rating: 3, address: 'Unkown', details: 'Unknown'},
  {name: 'Sweetgreen', rating: 3, address: 'Unkown', details: 'Unknown'},
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
  { restaurant_id: 1, user_id: 1, status:"Completed", start_time: '2022-10-11 12:37:00', max_number: 6 },
  { restaurant_id: 2, user_id: 1, status:"Upcoming", start_time: '2022-12-11 00:00:00', max_number: 6 }, 
  { restaurant_id: 3, user_id: 2, status:"Completed", start_time: '2002-10-19 14:43:00', max_number: 6 }, 
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

