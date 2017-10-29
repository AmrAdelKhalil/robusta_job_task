# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

if Rails.env.development?
  User.create!(email:"user@example.com", password: "123456")
  Director.create!(name: "Jack")
  first_movie = Movie.create!(name: "The mask", director_id: 1, releasing_date: Date.today.strftime("%Y-%m-%d"))
  second_movie = Movie.create!(name: "Titanic", director_id: 1, releasing_date: Date.today.strftime("%Y-%m-%d"))
  third_movie = Movie.create!(name: "Spider man", director_id: 1, releasing_date: Date.today.strftime("%Y-%m-%d"))
  Actor.create!(name: "Jim Carry")
  Actor.create!(name: "Jinnefer Aniston")
  Actor.create!(name: "Van Disel")
  Genre.create!(name: "Comedy")
  Genre.create!(name: "Action")
  Genre.create!(name: "Romantic")
  Review.create(description: 'amazing', user_id:1,movie_id:1, rate: 3)
  Review.create(description: 'boring', user_id:1,movie_id:2, rate: 4)
  first_movie.genres << Genre.first
  first_movie.genres << Genre.second
  second_movie.genres << Genre.first
  third_movie.genres << Genre.second
end
