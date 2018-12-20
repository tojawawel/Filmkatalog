class User < ApplicationRecord
  has_many :movies
  has_many :comments
  has_many :favourites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 def full_name
  "#{first_name} #{last_name}"
 end

 def admin?
   admin
 end
end
