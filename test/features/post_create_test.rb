require "test_helper"

feature "posting with valid information" do
  scenario "access the writing prompt" do
    visit posts_path
    click_button "New Post"
  end

  scenario "fill in and submit a new post" do
    fill_in "Title", with: "A sample title"
    fill_in "Content", with: "Here is some content!"
    click_button "Submit"
  end

  scenario "a successful post created" do
    visit posts_path
    page.text.must_include "Success"
    page.text.must_include "A sample title"
    page.text.must_include "Here is some content!"
  end
end

