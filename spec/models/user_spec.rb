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

  let(:van_gogh) { User.create!(name: "Van Gogh",
                               email: "van@gogh.com",
                               password:"testing1234",
                               statement: "This is the test statement",
                               artist: true) }

  let(:test_collection) {Collection.create!(name: "Test Collection",
                                            description: "A test of a collection")}

  # let(:test_piece) {Piece.create!()}

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

  describe "User validations" do

    new_user = User.new(name: "",
                        email: "",
                        password:"testing1234",
                        statement: "This is the test statement",
                        artist: false)

    it "User without a name is not valid" do
      expect(new_user.valid?).to be(false)
    end

    it "User without a name is receives appropriate message as feedback" do
      expect(new_user.errors.messages[:name][0]).to eq("can't be blank")
    end

    it "User without an email is not valid" do
      expect(new_user.valid?).to be(false)
    end
    it "User without an email receives appropriate message as feedback" do
      expect(new_user.errors.messages[:email][0]).to eq("can't be blank")
    end

  end

  describe "User can have collections" do

    it "Adds a collection to the user" do
      van_gogh.collections << test_collection
      expect(van_gogh.collections.first.name).to eq(test_collection.name)
    end
  end

  describe "User can create pieces and add to collections" do

  end



end
