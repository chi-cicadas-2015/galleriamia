User.delete_all
Collection.delete_all
Piece.delete_all
Tag.delete_all

user_types = ["artist", "friend"]

# Create users
20.times do
  user = User.new(name: Faker::Name.name,
                  email:Faker::Internet.email,
                  password:"testing1234",
                  statement: Faker::Company.catch_phrase,
                  type_of_user: "artist")
  user.save
end

# create 80 friends
80.times do
  friend = User.new(name: Faker::Name.name,
                  email:Faker::Internet.email,
                  password:"testing1234",
                  statement: Faker::Company.catch_phrase,
                  type_of_user: "friend")
  friend.save
end

# create random friendships - user_types.sample
50.times do
  target = User.find(rand(1..User.count))
  follower = User.find(rand(1..User.count))

  target.followers << follower if target.id != follower.id
end
