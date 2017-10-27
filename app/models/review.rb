class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  scope :movie_reviews, -> (movie_id) {where(:movie_id => movie_id)}


  def self.calculate_rating(reviews)
    maximum_rate = 5
    summation_of_rates = reviews.map{|review| review[:rate] unless review.rate.nil? }.inject(0, :+).to_f
    number_of_rates = reviews.length
    number_of_rates = number_of_rates + 1 if reviews.length == 0
    number_of_rates = number_of_rates  * maximum_rate
    summation_of_rates / number_of_rates * 5
  end
end
