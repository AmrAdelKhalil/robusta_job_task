class Genre < ApplicationRecord
  has_and_belongs_to_many :movies

  def self.names_of_all_generes
    Genre.all.map{|genre| genre.name}
  end
end
