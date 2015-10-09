User.create(name: "paulo",
            email:"p@g.com",
            password:"testing1234",
            statement: "These are tests",
            avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
            photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
            type_of_user: "artist"
            )

User.create(name: "David",
            email:"p@g.com",
            password:"testing1234",
            statement: "These are tests",
            avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
            photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
            type_of_user: "friend"
            )

User.create(name: "Greggo",
            email:"g@g.com",
            password:"testing1234",
            statement: "These are tests",
            avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
            photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
            type_of_user: "artist"
            )

User.create(name: "Nic",
            email:"n@g.com",
            password:"testing1234",
            statement: "These are tests",
            avatar_url: "https://upload.wikimedia.org/wikipedia/commons/c/c4/Lleyn_sheep.jpg",
            photo_url: "http://www.glaucus.org.uk/Sheep0007.jpg",
            type_of_user: "artist"
            )

Event.create(start_time: '10-09-2015 17:00',
             end_time: '10-09-2015 19:00',
             event_url: 'google.com',
             event_address: 'google.com',
             event_city: 'chicago',
             event_zip: '60614',
             host: 'DBC')

 Event.create(start_time: '11-11-2015 17:00',
              end_time: '11-11-2015 19:00',
              event_url: 'google.com',
              event_address: 'google.com',
              event_city: 'chicago',
              event_zip: '60614',
              host: 'DBC')

Friend.create(user_id: 1, friend_id: 2)
Friend.create(user_id: 1, friend_id: 3)
Friend.create(user_id: 3, friend_id: 1)

Collection.create(user_id: 1, name: "Collection test 1", description: "This is the description")

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
