# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.development?
  Movie.create!(name: "The mask")
  Actor.create!(name: "Jim Carry", movie_id: 1)
  Director.create!(name: "Jack", movie_id: 1)
  Genre.create!(name: "Comedy", movie_id: 1)
end
