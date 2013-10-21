require "test_helper"

feature "a logged in editor" do
  scenario "can write comments on a post" do
    sign_in(users(:editor))

    visit post_path(posts(:fp))

    click_on "Comment"
    fill_in "author", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Comment"

    visit post_path(posts(:fp))

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"
  end

  scenario "can publish comments" do
    sign_in(users(:editor))

    visit post_path(posts(:fp))

    click_on "Comment"
    fill_in "author", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Comment"

    visit post_path(posts(:fp))

    page.has_selector('check_box', :text => "Approved")
    page.check("Approved")

    click_on "Sign out"

    visit post_path(posts(:fp))

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"
  end
end
