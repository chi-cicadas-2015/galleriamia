class User < ActiveRecord::Base

  has_many :friends
  has_many :friends, through: :friends

  has_secure_password
end
