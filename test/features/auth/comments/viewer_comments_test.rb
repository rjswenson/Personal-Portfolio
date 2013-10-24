require "test_helper"

feature "a logged in viewer" do
  scenario "can write comments on a post" do
    sign_in(users(:author))

    visit post_path(posts(:fp))

    fill_in "name", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Submit"
    click_on "Sign out"

    sign_in(users(:editor))
    visit post_path(posts(:fp))

    page.text.must_include "Mr. Bojangles"
    page.text.must_include "This post is great"

  end

  scenario "can't publish comments" do
    sign_in(users(:author))

    visit post_path(posts(:fp))

    fill_in "name", with: "Mr. Bojangles"
    fill_in "comment", with: "This post is great"
    click_on "Submit"

    visit post_path(posts(:fp))

    page.text.wont_include "Approved"
    page.text.wont_include "Mr. Bojangles"
  end

  scenario "can write a comment on projects" do
    sign_in(users(:author))
    visit project_path(projects(:graffiti))

    fill_in "name", with: comments(:deny_graffiti).author
    fill_in "comment", with: comments(:deny_graffiti).content
    click_on "Submit"
    click_on "Sign out"

    sign_in(users(:editor))
    visit project_path(projects(:graffiti))

    page.text.must_include comments(:deny_graffiti).content
    page.text.must_include comments(:deny_graffiti).author
  end
end

feature "a non-logged viewer" do
  scenario "can't write comments on posts" do
    visit post_path(posts(:fp))
    page.assert_no_selector('form', :text => "Content")
  end

  scenario "can't publish comments on posts" do
    visit post_path(posts(:fp))
    page.assert_no_selector('check_box', :text => "Approved")
  end

  scenario "viewable published comments on projects" do
    sign_in(users(:editor))
    visit project_path(projects(:graffiti))

    fill_in "name", with: comments(:deny_graffiti).author
    fill_in "comment", with: comments(:deny_graffiti).content
    click_on "Submit"

    find(".comment:last").click("Approve")
    click_on "Sign out"

    visit project_path(projects(:graffiti))
    page.text.must_include comments(:deny_graffiti).author
    page.text.must_include comments(:deny_graffiti).content
  end

  scenario "CANT approve comments on projects" do
    sign_in(users(:author))
    visit project_path(projects(:graffiti))

    fill_in "name", with: "Newly Signed in User"
    fill_in "comment", with: "Some newly created comment"
    click_on "Submit"
    click_on "Sign out"
    visit project_path(projects(:graffiti))

    page.text.wont_include "Newly Signed in User"
    page.text.wont_include "Some newly created comment"
    page.assert_no_selector('check_box', :text => "Approved")
  end

  scenario "CANT write comments on projects" do
    visit project_path(projects(:graffiti))
    page.assert_no_selector('form', :text => "comment")
    page.has_no_button?("Submit")
  end
end
