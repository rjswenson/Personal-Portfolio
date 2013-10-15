require "test_helper"

feature "signing up" do
  scenario "accessing available links" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: "email@example.com"
    fill_in "Password", with: "password1234"
    fill_in "Password confirmation", with: "password1234"
    click_button "Sign up"

    page.text.must_include "Welcome! You have signed up successfully."
    page.text.wont_include "There was a problem with your sign up"
  end

#   scenario "adds a new user to the db" do
#     @user = User.new(email: "email@example.com", password: "password1234")
#     @user.id.wont_be_nil
#   end

#   scenario "with invalid information" do
#   end
end
