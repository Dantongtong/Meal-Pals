# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

reviews = [
  { resaurant_id: 1, user_id: 1, rating: 1, comment: 'Bad food.' },
  { resaurant_id: 1, user_id: 2, rating: 5, comment: 'Good food.' },
]

reviews.each do |review|
  Review.create!(review)
end

timeslots = [
  { resaurant_id: 1, owner: 1, guest: 2, start_time: '10-Nov-2022 12:00:00' },
]

timeslots.each do |timeslot|
  Timeslot.create!(timeslot)
end


# add user test data
User.create([{ email: 'test@columbia.edu', password: '123', first_name: 'test' },
             { email: 'byc@columbia.edu', password: '123', first_name: 'by' }])