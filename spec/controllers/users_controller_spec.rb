require 'rails_helper'

describe UsersController do

  let!(:user) {User.create!(name: "Michelangelo",
                    email: "michelangelo@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: true)}
  describe "GET index" do
    it "assigns all users as @artists" do
      get :index
      # expect(assigns(:artist)).to eq([user])
    end
  end

  describe "GET #show" do
    it "assigns user as the @user" do
      get :show, { id: user.to_param }
      # expect(assigns(:user)).to eq(game)
    end
  end

end
