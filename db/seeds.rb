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

Event.create(
              start_time: '10-09-2015 17:00',
              end_time: '10-09-2015 19:00',
              event_url: 'google.com',
              event_address: 'google.com',
              event_city: 'chicago',
              event_zip: '60614',
              host: 'DBC')

Friend.create(user_id: 1, friend_id: 2)
