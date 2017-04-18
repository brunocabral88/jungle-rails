require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: "John",
      last_name: "Doe",
      email: "test@test.org",
      password: "123123",
      password_confirmation: "123123"
    )
  end

  scenario "user can log in" do
    visit root_path
    click_on 'Login'
    fill_in :user_email, with: "test@test.org"
    fill_in :user_password, with: "123123"
    click_on 'Submit'
    expect(page).to have_text("Logged in as test@test.org")
    # fill_in 
  end

  scenario "user can log out" do
    visit root_path
    click_on 'Login'
    fill_in :user_email, with: "test@test.org"
    fill_in :user_password, with: "123123"
    click_on 'Submit'
    expect(page).to have_text("Logged in as test@test.org")
    
    click_on "Account"
    click_on "Logout"
    expect(page).to have_text("Logged out successfully!")
  end
  
end
