require "test_helper"

feature "a logged in viewer" do
  scenario "can write comments on a post" do
    sign_in(users(:author))

    visit post_path(posts(:fp))

    click_on "Comment"
    fill_in "author", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Comment"

    visit post_path(posts(:fp))

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"

  end

  scenario "can't publish comments" do
    sign_in(users(:author))

    visit post_path(posts(:fp))

    click_on "Comment"
    fill_in "author", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Comment"

    visit post_path(posts(:fp))

    page.text.wont_include "Approved"
  end
end

feature "a non-logged viewer" do
  scenario "can't write comments" do
    visit posts_path(posts(:fp))
    page.assert_no_selector('form', :text => "Content")
  end

  scenario "can't publish comments" do
    visit posts_path(posts(:fp))
    page.assert_no_selector('check_box', :text => "Approved")
  end
end
