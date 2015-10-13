require 'rails_helper'


describe Piece do

  let(:van_gogh) { User.create!(name: "Van Gogh",
                               email: "van@gogh.com",
                               password:"testing1234",
                               statement: "This is the test statement",
                               artist: true,
                               avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

  let(:test_piece) {Piece.create!(title: "This is A Test Piece",
                                  medium: "Oil",
                                  description: "This is a great test for a great piece",
                                  artist_id: van_gogh.id)}

  it "Creates a piece object" do
    expect(test_piece).to be_a(Piece)
  end

  describe "Piece object has the correct attributes" do
    it "The piece has a title" do
      expect(test_piece.title).to eq("This is A Test Piece")
    end

    it "The piece has a medium" do
      expect(test_piece.medium).to eq("Oil")
    end

    it "The piece has a description" do
      expect(test_piece.description).to eq("This is a great test for a great piece")
    end

    it "The piece references an artist via an id" do
      expect(test_piece.artist_id).to eq(van_gogh.id)
    end

  end

  describe "Pieces belong to collections" do
    let(:test_collection) {Collection.create!(name: "Test Collection",
                                              description: "A test of a collection")}

    it "A piece can be added to a collection" do
      test_collection.pieces << test_piece
      expect(test_collection.pieces.first).to eq(test_piece)
    end
  end

end
