require "test_helper"

feature "a logged in editor" do
  scenario "can write comments on a post" do
    sign_in(users(:editor))
    visit post_path(posts(:fp))

    fill_in "name", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    fill_in "email", with: "email@example.com"

    click_on "Submit"

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"
  end

  scenario "can publish comments" do
    sign_in(users(:editor))

    visit post_path(posts(:fp))

    fill_in "name", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    fill_in "email", with: "email@example.com"
    click_on "Submit"

    visit post_path(posts(:fp))

    page.has_button?("Approve")

    click_on "Approve"

    click_on "Sign out"

    visit post_path(posts(:fp))

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"
  end
end
