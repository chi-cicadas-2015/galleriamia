class User < ActiveRecord::Base
  has_many :friends
  has_many :followers, through: :friends, source: "friend"

  has_many :event_users
  has_many :events, through: :event_users
  has_many :collections
  has_secure_password
end
