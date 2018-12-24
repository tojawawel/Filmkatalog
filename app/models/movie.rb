class Movie < ApplicationRecord
  searchkick word_start: [:name]
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_attached_file :cover, styles: { :cover => "500x300" }
  validates_attachment_content_type :cover, content_type: /\Aimage\/.*\z/

  validates :name ,presence: true, uniqueness: true
  validates :premiere_date ,presence: true
  validates :length ,presence: true, numericality: { greater_than:0,  only_integer: true }
  validates :director ,presence: true
  validates :scenarist ,presence: true
  validates :country ,presence: true
  validates :description ,presence: true, length: { minimum:1}

  def country_name
    iso_country = ISO3166::Country[country] # `country` should be code like 'AU'
    iso_country.translations[I18n.locale.to_s] || iso_country.name
  end

  # def self.search
  #   if term
  #     # where('name LIKE ?', "%#{term}%")
  #     search(search)
  #   else
  #     all
  #   end
  # end
end
