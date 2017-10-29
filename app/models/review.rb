class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  scope :movie_reviews, -> (movie_id) {where(:movie_id => movie_id).order("created_at DESC")}


  def self.calculate_rating(reviews)
    summation_of_rates = reviews.map{|review| review[:rate] unless review.rate.nil? }.inject(0, :+).to_f
    number_of_rates = reviews.length
    number_of_rates = number_of_rates + 1 if reviews.length.zero?
    summation_of_rates / number_of_rates
  end
end
