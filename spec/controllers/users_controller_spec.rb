require 'rails_helper'

describe UsersController do

  let(:van_gogh) { User.create!(name: "Van Gogh",
                               email: "van@gogh.com",
                               password:"testing1234",
                               statement: "This is the test statement",
                               artist: true,
                               avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png")) }

  let(:not_artist) { User.create(name: "Pablo NOT Picasso",
                    email: "friend@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    avatar: File.new("#{Rails.root}/public/imgs/favicon63x54.png")) }

  let(:test_collection) {Collection.create!(name: "Test Collection",
                                            description: "A test of a collection")}

  describe "GET #index" do
    it "assigns users that are artists to @artists" do
      get :index
      expect(assigns(:artists)).to eq([van_gogh])
    end
  end

  describe "GET #show" do
    it "assigns artist to @user" do
      get :show, id: van_gogh.id
      expect(assigns(:user)).to eq(van_gogh)
    end

    it "assigns the user's collections to @collections" do
      get :show, id: van_gogh.id
      expect(assigns(:collections)).to eq(van_gogh.collections)
    end
  end

  describe "GET #new" do
    it "assigns an empty user to the form as @user" do
      get :new
      expect(assigns(:user)).to be_a(User)
    end
  end

end
