class User < ActiveRecord::Base
  validates :name, :password, { presence: true }
  validates :email, { presence: true, uniqueness: true }

  has_many :friends
  has_many :followers, through: :friends, source: "friend"
  has_one :profile

  has_many :event_users
  has_many :events, through: :event_users
  has_many :collections

  has_secure_password

  has_attached_file :avatar,
                    :styles => { :thumb => "100x100>",
                                 :large => "300x300>"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]
end
