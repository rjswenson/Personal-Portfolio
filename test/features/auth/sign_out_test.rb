require "test_helper"

feature "signing out" do
  scenario "for a currently logged in user" do
    user1 = User.create(email: "email@example.com", password: "password123",
                password_confirmation: "password123")
    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign in"

    click_link "Sign out"

    page.text.must_include "Sign in"
    page.text.must_include "Sign up"
  end
end

