class Movie < ApplicationRecord
  validates_presence_of :name, :premiere_date, :length, :director, :scenarist, :country, :description
  validates_uniqueness_of :name
  validates_length_of :description, minimum: 100, maximum: 300
end
