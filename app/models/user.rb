class User < ActiveRecord::Base

  has_many :friends
  has_many :friends, through: :friends
  has_many :events
  has_many :collections

  has_secure_password
end
