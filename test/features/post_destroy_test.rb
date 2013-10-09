require "test_helper"

feature "destroying a current post" do
  scenario "successfully destroyed post" do
    visit posts_path

    click_on "New Post"
    fill_in 'Title', with: "A sample title"
    fill_in 'Body', with: "Here is some content!"
    click_on 'Create Post'

    visit posts_path
    click_on 'Destroy'
    page.text.wont_include "A sample title"
    page.text.wont_include "Here is some content!"
  end
end
