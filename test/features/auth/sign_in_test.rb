require "test_helper"

feature "Sign in an existing user" do
  scenario "with valid information" do

   user1 = User.create(email: "email@example.com", password: "password123",
                  password_confirmation: "password123")

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign in"

    page.text.must_include "Sign out"
    page.text.wont_include "Sign in"
    page.text.wont_include "Sign up"
  end
end
