require 'rails_helper'

describe WelcomeController do

  describe "WelcomeController can handle searches correctly" do

    let(:van_gogh) { User.create!(name: "Van Gogh",
                                 email: "van@gogh.com",
                                 password:"testing1234",
                                 statement: "This is the test statement",
                                 artist: true,
                                 avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

     let(:test_collection) {Collection.create!(name: "Test Collection",
                                               description: "A test of a collection")}

    it "GET #search renders the correct template" do
      get :search, {query: van_gogh.name}
      expect(response).to render_template("search")
    end

    it "GET #search finds the artist we pass" do
      get :search, {query: van_gogh.name}
      expect(assigns(:artist_results)).to eq([van_gogh])
    end

    it "GET #search finds the collection we pass" do
      van_gogh.collections << test_collection
      get :search, {query: test_collection.name}
      expect(assigns(:collection_results)).to eq([test_collection])
    end
  end
end
