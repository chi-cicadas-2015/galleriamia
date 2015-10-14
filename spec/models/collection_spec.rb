require 'rails_helper'

describe Collection do

  let(:van_gogh) { User.create!(name: "Van Gogh",
                               email: "van@gogh.com",
                               password:"testing1234",
                               statement: "This is the test statement",
                               artist: true,
                               avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

  let(:test_collection) {Collection.create!(name: "Test Collection",
                                            description: "A test of a collection")}

  describe "A collection is created correctly" do

    it "Creates a collection object" do
      expect(test_collection).to be_a(Collection)
    end

    it "The collection has a name" do
      expect(test_collection.name).to eq("Test Collection")
    end

    it "The collection has a description" do
      expect(test_collection.description).to eq("A test of a collection")
    end

    it "The collection belongs to a user" do
      van_gogh.collections << test_collection
      expect(test_collection.user.name).to eq("Van Gogh")
    end
  end


end
