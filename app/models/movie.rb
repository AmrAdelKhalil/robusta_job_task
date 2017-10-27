class Movie < ApplicationRecord
  has_many :actors
  has_one :director
  has_many :genres
end
