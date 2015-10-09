class User < ActiveRecord::Base

  has_many :friends
  has_many :followers, through: :friends, source: "user"
  has_many :follows, through: :friends, source: "friend" # This works! obj.follows works


  # Works.
  has_many :event_users
  has_many :events, through: :event_users
  has_many :collections
  has_secure_password


  def follow(friend_target)
    target = User.find(friend_target.id)
    friend = Friend.new(user_id: self.id, friend_id: target.id)
    friend.save

    # target.followers << friend

    target.followers << self # without this, I can't get the user.followers to do what I want,
                             # This however, duplicates the save and this is the "nil" save.
  end



end
