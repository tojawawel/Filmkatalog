class Movie < ApplicationRecord
  validates_presence_of :name, :length, :genre, :director, :scenarist, :country, :description
  validates_uniqueness_of :name

end
