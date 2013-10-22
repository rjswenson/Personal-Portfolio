require "test_helper"

feature "signing out" do
  scenario "for a currently logged in user" do
    sign_in(users(:one))

    click_link "Sign out"

    page.text.must_include "Sign in"
    page.text.must_include "Sign up"
  end
end

