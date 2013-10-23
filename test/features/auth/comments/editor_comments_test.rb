require "test_helper"

feature "a logged in editor" do
  scenario "can write comments on a post" do
    sign_in(users(:editor))
    visit post_path(posts(:fp))

    fill_in "name", with: users(:author).name
    fill_in "comment", with: comments(:author).content
    fill_in "email", with: comments(:author).author_email
    click_on "Submit"

    page.text.must_include users(:author).name
    page.text.must_include comments(:author).author_email
  end

  scenario "can publish comments on posts" do
    sign_in(users(:editor))
    visit post_path(posts(:fp))

    fill_in "name", with: users(:author).name
    fill_in "comment", with: comments(:author).content
    fill_in "email", with: comments(:author).author_email
    click_on "Submit"

    visit post_path(posts(:fp))
    page.has_button?("Approve")
    click_on "Approve"
    click_on "Sign out"
    visit post_path(posts(:fp))

    page.text.must_include users(:author).name
    page.text.must_include comments(:author).author_email
  end

  scenario "can write comments on projects" do
    sign_in(users(:editor))
    visit project_path(projects(:graffiti))

    fill_in "name", with: users(:author).name
    fill_in "comment", with: comments(:author).content
    fill_in "email", with: comments(:author).author_email
    click_on "Submit"

    page.text.must_include users(:author).name
    page.text.must_include comments(:author).author_email
  end

  scenario "can approve comments on projects" do
    sign_in(users(:editor))
    visit project_path(projects(:graffiti))

    fill_in "name", with: users(:author).name
    fill_in "comment", with: comments(:author).content
    fill_in "email", with: comments(:author).author_email
    click_on "Submit"
    page.has_button?("Approve")
    click_on "Approve"
    click_on "Sign out"
    visit project_path(projects(:graffiti))

    page.text.must_include users(:author).name
    page.text.must_include comments(:author).author_email
  end

  scenario "can delete comments on projects" do
    sign_in(user(:editor))
    visit project_path(projects(:graffiti))

    fill_in "name", with: users(:author).name
    fill_in "comment", with: comments(:author).content
    fill_in "email", with: users(:author).email
    click_on "Submit"
    page.has_button?("Approve")
    click_on "Approve"

    page.has_button?("Delete")
    click_on "Delete"

    page.text.wont_include("#{users(:author).name}")
    page.text.wont_include("#{comments(:author).content}")
  end
end
