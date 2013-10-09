require "test_helper"

feature "Editting an existing post" do
  scenario "with valid changes" do
    visit posts_path

    click_on 'New Post'
    fill_in 'Title', with: "A sample title"
    fill_in 'Body', with: "Here is some content!"
    click_on('Create Post')
    visit posts_path

    click_on('Edit')

    fill_in 'Title', with: "New Adventures"
    fill_in 'Body', with: "Here we go again"
    click_on('Update Post')
    visit posts_path

    page.text.wont_include "sample title"
    page.text.wont_include "Here is some content!"


    page.text.must_include "New Adventures"
    page.text.must_include "Here we go again"
  end
end
