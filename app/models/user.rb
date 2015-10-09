class User < ActiveRecord::Base
  has_many :followers, class_name: "User", foreign_key: "artist_id"
  belongs_to :artist, class_name: "User"
  has_secure_password
end
