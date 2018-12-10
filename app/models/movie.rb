class Movie < ApplicationRecord
  validates :name ,presence: true, uniqueness: true
  validates :premiere_date ,presence: true
  validates :length ,presence: true, numericality: { greater_than:0,  only_integer: true }
  validates :director ,presence: true
  validates :scenarist ,presence: true
  validates :country ,presence: true
  validates :description ,presence: true, length: { minimum:1}

  has_many :comments, dependent: :destroy
    def country_name
      iso_country = ISO3166::Country[country] # `country` should be code like 'AU'
      iso_country.translations[I18n.locale.to_s] || iso_country.name
    end
end
