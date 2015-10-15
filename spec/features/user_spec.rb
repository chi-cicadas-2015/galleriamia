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

      def user_logs_in(input_user)
        visit '/login'
        fill_in "Email", :with => input_user.email
        fill_in "Password", :with => input_user.password
        click_button("Save Session")
        visit user_path(input_user.id)
      end

      def click_about_then_edit_profile
        click_link('About')
        click_link('Edit Profile')
      end

      def login_and_edit
        user_logs_in(artist)
        click_about_then_edit_profile
      end

      def persist_non_user_to_database
        not_artist.save
      end

      it "User clicks the 'Edit' button in the About tab and is redirected to the Edit Profile page" do
        login_and_edit
        expect(page).to have_content("Edit User")
      end

      it "User can see prefilled name in the form" do
        login_and_edit
        expect(page).to have_css('#user_name')
      end

      it "User can see prefilled email in the form" do
        login_and_edit
        expect(page).to have_css('#user_email')
      end

      it "User can see prefilled statement in the form" do
        login_and_edit
        expect(page).to have_css('#user_statement')
      end

      it "User can upload a new avatar" do
        login_and_edit
        expect(page).to have_css('#user_avatar')
      end

      context "An artist can edit additional profile information" do

        it "Artist can edit the Top collection field" do
          login_and_edit
          expect(page).to have_css('#user_profile_attributes_top_collection')
        end

        it "Artist can edit the Website field" do
          login_and_edit
          expect(page).to have_css('#user_profile_attributes_website_url')
        end

        it "Artist can edit the Primary Medium field" do
          login_and_edit
          expect(page).to have_css('#user_profile_attributes_primary_medium')
        end

        it "Artist can edit the Headshot field" do
          login_and_edit
          expect(page).to have_css('#user_profile_attributes_headshot')
        end

        it "Artist can edit the password field" do
          login_and_edit
          expect(page).to have_css('#user_password')
          expect(page).to have_css('#user_password_confirmation')
        end
      end

      context "Artist fills in information and the information persists to the database" do

        it "Artist changes the Email field" do
          login_and_edit
          fill_in "user_email", :with => "new_email@testing.com"
          click_button "Save User"
          artist_post_save = User.find(artist.id)
          expect(artist.email).to_not eq(artist_post_save.email)
        end
      end

      context "Only artists can edit additional profile information" do

        it "Non-artist can not see additional profile data in the edit page" do
          persist_non_user_to_database
          expect(page).to_not have_field("Website URL")
        end

        it "Non-artist can not see additional profile data because he/she doesn't have an additional profile" do
          persist_non_user_to_database
          profile = Profile.find_by(user_id: not_artist.id)
          expect(profile).to be nil
        end
      end
    end
  end
end
