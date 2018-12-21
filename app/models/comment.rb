class Comment < ApplicationRecord
  validates :rate ,presence: true, numericality: { greater_than:0,less_or_equal_than:10,  only_integer: true }
  validates :body ,presence: true, length: { minimum:5}
  belongs_to :movie
  belongs_to :user
  paginates_per 5
end
