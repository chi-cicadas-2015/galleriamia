require 'rails_helper'

feature "User features" do

  let(:artist) { User.create!(name: "Pablo Picasso",
                    email: "testing@mail.com",
                    password:"testing1234",
                    statement: "This is the test statement",
                    artist: true,
                    avatar: File.new("#{Rails.root}/public/imgs/favicon125x108.png"),
                    profile: artist_profile) }

  let(:artist_profile) { Profile.create!(top_collection: "Years of Time",
                                   website_url: "https://en.wikipedia.org/wiki/Vincent_van_Gogh",
                                   primary_medium: "Oil",
                                   headshot: File.new("#{Rails.root}/public/imgs/favicon63x54.png")) }

  # New is used in order to not persist the artist. This is done to simulate the login feature.
  let(:not_artist) { User.new(name: "Pablo NOT Picasso",
                     email: "friend@mail.com",
                     password:"testing1234",
                     statement: "This is the test statement",
                     avatar: File.new("#{Rails.root}/public/imgs/favicon63x54.png")) }

  feature "User - Landing page" do
    scenario "User visits the root and is greated with options" do
      visit "/"
      expect(page).to have_link("Galleria Mia")
      expect(page).to have_link("Random Artist")
      expect(page).to have_link("Sign Up")
    end

    scenario "User selects the Sign Up option and creates an account" do
      visit new_user_path
      fill_in "Name", :with => not_artist.name
      fill_in "Email", :with => not_artist.email
      fill_in "Password", :with => not_artist.password
      click_button "Save User"
      expect(page).to have_text("Your account was saved successfully")
      expect(page).to have_content(not_artist.name)
    end

  end

  feature "User - Edit functionality" do

    context "User logs in" do

      def user_logs_in
        visit '/login'
        fill_in "Email", :with => artist.email
        fill_in "Password", :with => artist.password
        click_button("Save Session")
      end

      it "User clicks the 'Edit' button in the About tab" do
        user_logs_in
        visit user_path(artist.id)
        click_link('About')
        click_link('Edit Profile')
        expect(page).to render_template(:edit)
      end

      it "User can see what information to edit" do
        visit edit_user_path(artist)
        expect(page).to have_text("Name")
      end
    end
  end
end
