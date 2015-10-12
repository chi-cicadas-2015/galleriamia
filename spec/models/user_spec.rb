require 'rails_helper'

User.delete_all

describe User do

  artist = User.create(name: "Pablo Picasso",
                    email: "testing@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: true)

  non_artist = User.create(name: "Pablo NOT Picasso",
                    email: "friend@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: false)

  describe "Artist" do

    it "Creates an artist user correctly" do
      expect(artist).to be_a(User)
    end

    it "Persists the artist to the database" do
      expect("Pablo Picasso").to eq(User.first.name)
    end
  end

  describe "Non-Artist" do

    it "Creates a non-artist user correctly" do
      expect(non_artist).to be_a(User)
    end

    it "Persists the non-artist to the database" do
      expect("Pablo NOT Picasso").to eq(non_artist.name)
    end

  end

  describe "Followers" do

    it "Artist follower count increases when followed" do

      follower_count_pre = artist.followers.length
      artist.followers << non_artist
      follower_count_post = artist.followers.length

      expect(follower_count_pre).to be < follower_count_post
    end

    it "Non-artist follower count increases when followed by an artist" do
      follower_count_pre = non_artist.followers.length
      non_artist.followers << artist
      follower_count_post = non_artist.followers.length

      expect(follower_count_pre).to be < follower_count_post
    end

  end

  # validations work appropriately

  describe "Model validations" do

    new_user = User.new(name: "",
                        email: "",
                        password:"testing1234",
                        statement: "This is the test statement",
                        artist: false)

    it "User name presence" do
      expect(new_user.valid?).to be(false)
      expect(new_user.errors.messages[:name][0]).to eq("can't be blank")
    end

    it "Email presence and uniqueness" do
      expect(new_user.valid?).to be(false)
      expect(new_user.errors.messages[:email][0]).to eq("can't be blank")
    end
  end

  # can create collections and assign to the user

  # can create pieces



end
