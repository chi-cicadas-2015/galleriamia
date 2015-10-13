require 'rails_helper'

User.delete_all

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
  scenario "User clicks the Edit settings button from his/her profile page" do
    user =  User.last
    visit edit_user_path(user)
    expect(page).to have_text("Name")
  end
end
