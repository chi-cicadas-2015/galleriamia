require 'rails_helper'

User.delete_all

describe User do

  artist = User.create!(name: "Pablo Picasso",
                    email: "testing@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: true,
                    avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png"))

  artist_profile = Profile.create!(top_collection: "Years of Time",
                                   website_url: "https://en.wikipedia.org/wiki/Vincent_van_Gogh",
                                   primary_medium: "Oil",
                                   headshot: File.new("#{Rails.root}/public/imgs/favicon63x54.png"))

  artist.profile = artist_profile

  non_artist = User.create(name: "Pablo NOT Picasso",
                    email: "friend@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: false,
                    avatar: File.new("#{Rails.root}/public/imgs/favicon63x54.png"))

  let(:van_gogh) { User.create!(name: "Van Gogh",
                               email: "van@gogh.com",
                               password:"testing1234",
                               statement: "This is the test statement",
                               artist: true,
                               avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

  let(:test_collection) {Collection.create!(name: "Test Collection",
                                            description: "A test of a collection")}

  describe "Artist" do

    describe "Persists an artist to the database" do
      it "Artist is a user object" do
        expect(artist).to be_a(User)
      end

      it "Artist has a name" do
        expect(artist.name).to eq("Pablo Picasso")
      end

      it "Artist has an email address" do
        expect(artist.email).to eq("testing@mail.com")
      end

      it "Artist has a statement" do
        expect(artist.statement).to eq("This is the test statement")
      end

      it "Artist is an artist" do
        expect(artist.artist).to eq(true)
      end

      it "Artist has an avatar" do
        expect(artist.avatar?).to eq(true)
      end
    end


    describe "Creates a profile for the artist" do

      it "Artist can set a top collection" do
        expect(artist.profile.top_collection).to eq("Years of Time")
      end

      it "Artist can set a website in the profile" do
        expect(artist.profile.website_url).to eq("https://en.wikipedia.org/wiki/Vincent_van_Gogh")
      end

      it "Artist can set a primary medium in the profile" do
        expect(artist.profile.primary_medium).to eq("Oil")
      end

      it "Artist can set a profile picture" do
        expect(artist.profile.headshot?).to be(true)
      end
    end
  end

  describe "Non-Artist" do
    it "Creates a non-artist user correctly" do
      expect(non_artist).to be_a(User)
    end

    it "Persists the non-artist to the database" do
      expect("Pablo NOT Picasso").to eq(non_artist.name)
    end

    it "Non-artist is not an artist in our database" do
      expect(non_artist.artist).to eq(false)
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
    let(:test_piece) {Piece.create!(title: "This is A Test Piece",
                                    medium: "Oil",
                                    description: "This is a great test for a great piece",
                                    artist_id: van_gogh.id)}

    it "User adds a piece to a collection" do
      van_gogh.collections << test_collection
      van_gogh.collections.first.pieces << test_piece
      expect(van_gogh.collections.first.pieces.first.title).to eq("This is A Test Piece")
    end
  end

end
