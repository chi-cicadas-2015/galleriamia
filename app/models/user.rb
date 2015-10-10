class User < ActiveRecord::Base
  validates :name, :password, { presence: true }
  validates :email, { presence: true, uniqueness: true }

  has_many :friends
  has_many :followers, through: :friends, source: "friend"

  has_many :event_users
  has_many :events, through: :event_users
  has_many :collections
  
  has_secure_password
end
