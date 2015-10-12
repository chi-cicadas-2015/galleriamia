require 'rails_helper'


feature "User - Landing page" do
  scenario "User visits the root and is greated with options" do
    visit '/'
    expect(page).to have_text("Galleria Mia")
    expect(page).to have_text("Random Artist")
    expect(page).to have_text("Sign Up")
  end

  scenario "User selects the Sign Up option and creates an account" do
    visit "/users/new"
    fill_in "Name", :with => "Rafael"
    fill_in "Email", :with => "rafael@fakemail.com"
    fill_in "Password", :with => "testing1234"
    click_button "Save User"
    expect(page).to have_text("Your account was saved successfully")
    expect(page).to have_text("John Doe")
  end


end

feature "User - Profile page" do
  scenario "User can see information about his/her profile" do
    User.create!(name: "Donatello",
                   email: "donatello@fakemail.com",
                   password: "testing1234",
                   statement: "This is a test statement",
                   artist: true)
    user = User.last
    visit "/users/#{user.id}"

    expect(page).to have_text("#{user.name}")
    expect(page).to have_text("Edit Settings")
    expect(page).to have_text("Collections")
    expect(page).to have_text("About")
    expect(page).to have_text("Events")
  end
end


feature "" do
  scenario "" do

  end
end
