user_types = ["artist", "friend"]

# Create users
# 20.times do
#
#   u = User.create(name: Faker::Name.name,
#                   email:Faker::Internet.email,
#                   password:"testing1234",
#                   statement: Faker::Company.catch_phrase,
#                   avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
#                   photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
#                   type_of_user: user_types.sample)
# end

# Make friends
# 20 times do
#   Friend.create(user_id: rand(User.count), friend_id: rand(User.count))
# end

User.create(name: "Paulo",
                email:"y",
                password:"testing1234",
                statement: "s",
                avatar_url: "e",
                photo_url: "e",
                type_of_user: "artist")

User.create(name: "Maddie",
                email:"y",
                password:"testing1234",
                statement: "s",
                avatar_url: "e",
                photo_url: "e",
                type_of_user: "friend")



Collection.create(user_id: 1, name: "Collection test 1", description: "This is the description")

# Generate Pieces





# Generate Collections, assign pieces to Collections






Piece.create(title: "Sheep Stanza1", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza2", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza3", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza4", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza5", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza6", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")
Piece.create(title: "Sheep Stanza7", size: "L", medium: "A medium", image_url_thumb: "www", url_full: "www_full", description: "This is a painting about a sheep, yes, you got it")

Tag.create(name: "awesome")
Tag.create(name: "yes")
Tag.create(name: "baby")
Tag.create(name: "get some")
Tag.create(name: "woooo")
Tag.create(name: "greg")
