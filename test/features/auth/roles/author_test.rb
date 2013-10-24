require "test_helper"

feature "A user is flagged as author" do
  scenario "they can create posts" do
    sign_in(users(:author))

    visit posts_path
    click_on 'New Post'
    fill_in 'Title', with: posts(:fp).title
    fill_in 'Body', with: posts(:fp).body
    click_on 'Create Post'

    page.text.must_include "Post was successfully created"
    page.text.must_include posts(:fp).title
    page.text.must_include posts(:fp).body
    page.text.must_include users(:author).email
  end

  scenario "they can update their posts" do
    sign_in(users(:author))
    visit post_path(posts(:unpub))

    click_on 'Edit'
    fill_in 'Title', with: "New Adventures"
    fill_in 'Body', with: "Here we go again"
    click_on 'Update Post'

    visit posts_path

    page.text.must_include "New Adventures"
    page.text.must_include "Here we go again"
  end

  scenario "they CANT publish their posts" do
    sign_in(users(:author))
    visit post_path(posts(:unpub).id)

    page.text.wont_include "Publish"

  end

  scenario "they CANT delete posts" do
    sign_in(users(:author))
    visit post_path(posts(:fp).id)

    page.text.wont_include "Destroy"

  end
end
