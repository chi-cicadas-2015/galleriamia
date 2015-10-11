User.delete_all
Collection.delete_all
Piece.delete_all
Tag.delete_all

# Create users
20.times do
  user = User.new(name: Faker::Name.name,
                  email:Faker::Internet.email,
                  password:"testing1234",
                  statement: Faker::Company.catch_phrase,
                  artist: true)
  user.save
end

# Create 80 friends
80.times do
  friend = User.new(name: Faker::Name.name,
                  email:Faker::Internet.email,
                  password:"testing1234",
                  statement: Faker::Company.catch_phrase,
                  artist: false)
  friend.save
end

# Create random friendships
50.times do
  target = User.find(rand(1..User.count))
  follower = User.find(rand(1..User.count))

  target.followers << follower if target.id != follower.id
end

# Create tags
40.times do
  c = Collection.new(user_id: rand(1..User.count),
                     name: Faker::Company.catch_phrase,
                     description: Faker::Company.catch_phrase)
  c.save
end

30.times do
  t = Tag.new(name: Faker::Commerce.product_name)
  t.save
end

sizes = ["9x12", "10x14", "15x22", "22x30"]

artist_pool = User.where(artist: true)

100.times do
  p = Piece.new(title: Faker::Commerce.product_name,
                size: sizes.sample,
                medium: "medium",
                image_url_thumb: "url",
                url_full: "url",
                description: Faker::Company.catch_phrase,
                artist_id: artist_pool.sample.id)
  p.save
end
