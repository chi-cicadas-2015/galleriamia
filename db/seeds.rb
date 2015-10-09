# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(name: "paulo",
            email:"gonzalez",
            password:"testing1234",
            statement: "These are tests",
            avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
            photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
            type_of_user: "artist")
