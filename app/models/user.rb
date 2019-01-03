class User < ApplicationRecord
  has_many :movies, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favourites
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 has_attached_file :avatar, styles: { :thumb => "40x40#", :small  => "150x150>", :medium => "200x200" }
 validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
 acts_as_messageable

 def full_name
  "#{first_name} #{last_name}"
 end

 def admin?
   admin
 end

 def name
  "User #{id}"
 end

  def mailboxer_email(object)
    nil
  end
end
