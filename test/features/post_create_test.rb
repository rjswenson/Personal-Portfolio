require "test_helper"

feature "posting with valid information" do
  scenario "fill in and submit a new post" do
    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: "A sample title"
    fill_in 'Body', with: "Here is some content!"
    click_on 'Create Post'

    page.text.must_include "Post was successfully created"
    page.text.must_include "A sample title"
    page.text.must_include "Here is some content!"
  end
end

