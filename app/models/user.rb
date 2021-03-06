class User < ActiveRecord::Base
  validates :name, { presence: true }
  validates :email, { presence: true, uniqueness: true }
  validates :password, presence: true, on: :create

  has_many :friends
  has_many :followers, through: :friends, source: "friend"
  has_one :profile
  accepts_nested_attributes_for :profile

  has_many :event_users
  has_many :events, through: :event_users
  has_many :collections


  has_secure_password

  has_attached_file :avatar,
                    :styles => { :thumb => "100x100>",
                                 :large => "300x300>"},
                    :default_style => { :thumb => "100x100>" },
                    :default_url => "/imgs/avatar/default_avatar_thumb.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: [/png\Z/, /PNG\Z/, /jpe?g\Z/, /JPE?G\Z/]


  def set_default_avatar(user)
    if user.avatar.avatar_file_name == nil
      user.avatar.avatar_file_name = "default_avatar_thumb.png"
    end
  end



end
