require "test_helper"

feature "destroying a current post" do
  scenario "successfully destroyed post" do
    visit root_path
    click_button "New Post"

    fill_in "Title", with: "A sample title"
    fill_in "Content", with: "Here is some content!"
    click_button "Submit"

    visit root_path
    click_button "Delete"
    page.text.wont_include "A sample title"
    page.text.wont_include "Here is some content!"
  end
end
