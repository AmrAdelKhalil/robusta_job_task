# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.development?
  User.create!(email:"a@b.com", password: "123456")
  Director.create!(name: "Jack")
  Movie.create!(name: "The mask", director_id: 1, releasing_date: Date.today.strftime("%Y-%m-%d"))
  Actor.create!(name: "Jim Carry")
  Genre.create!(name: "Comedy")
  Review.create(description: 'amazing', user_id:1,movie_id:1)
end
