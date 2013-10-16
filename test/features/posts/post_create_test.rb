require "test_helper"

feature "posting with valid information" do
  scenario "fill in and submit a new post" do

    sign_in

    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:fp).title
    fill_in 'Body', with: posts(:fp).body
    click_on 'Create Post'

    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:fp).title
    page.text.must_include posts(:fp).body
    page.text.must_include users(:one).email
  end
end

