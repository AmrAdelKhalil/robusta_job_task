class Movie < ApplicationRecord
  has_and_belongs_to_many :actors
  belongs_to :director
  has_and_belongs_to_many :genres
  has_many :watchlists
  has_many :reviews
end
