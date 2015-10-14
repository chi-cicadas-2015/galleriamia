require 'rails_helper'

feature "User - Landing page" do
  scenario "User visits the root and is greated with options" do
    visit "/"
    expect(page).to have_link("Galleria Mia")
    expect(page).to have_link("Random Artist")
    expect(page).to have_link("Sign Up")
  end

  scenario "User selects the Sign Up option and creates an account" do
    visit new_user_path
    fill_in "Name", :with => "Rafael"
    fill_in "Email", :with => "rafael@fakemail.com"
    fill_in "Password", :with => "testing1234"
    click_button "Save User"
    expect(page).to have_text("Your account was saved successfully")
    expect(page).to have_content("Rafael")
  end
end

feature "User - Edit settings page" do
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
  scenario "User clicks the Edit settings button from his/her profile page" do
    # user =  User.create
    visit edit_user_path(artist)
    expect(page).to have_text("Name")
  end
end
