require "test_helper"

feature "Editting an existing post" do
  scenario "with valid changes" do
    visit posts_path
    click_button "New Post"
    fill_in "Title", with: "A sample title"
    fill_in "Content", with: "Here is some content!"
    click_button "Submit"
    visit posts_path
    click_button "Edit"

    fill_in "Title", with: "New Adventures"
    fill_in "Content", with: "Here we go again"
    click_button "Submit"

    scenario "old text will be removed" do
      page.text.wont_include "sample title"
      page.text.wont_include "Here is some content!"
    end

    scenario "new changes will be saved" do
      page.text.must_include "New Adventures"
      page.text.must_include "Here we go again"
    end
  end
end
