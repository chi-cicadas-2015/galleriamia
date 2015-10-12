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

feature "User - Login/Profile page" do

  User.create!(name: "Donatello",
               email: "donatello@fakemail.com",
               password: "testing1234",
               statement: "This is a test statement",
               artist: true)

  user = User.last

  # p user == User.last
  #
  # p user.valid?
  #
  # p User.all
  #
  # p user.errors

  # TODO
  # scenario "User can log in" do
  #   visit login_path
  #   expect(page).to have_content("Login")
  #   expect(page).to have_content("Sign Up")
  #   fill_in("session_email", :with => user.email)
  #   fill_in("session_password", :with => "testing1234")
  #   save_and_open_page
  #   click_button 'Save Session'
  #   expect(page).to have_text("Sign in successful")
  # end

  scenario "User can see information about his/her profile after logging in" do
    # TODO
  end
end


feature "User - Edit settings page" do
  scenario "User clicks the Edit settings button from his/her profile page" do
    user =  User.last
    visit edit_user_path(user)
    expect(page).to have_text("Name")
  end
end
