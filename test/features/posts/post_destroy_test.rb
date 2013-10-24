require "test_helper"

feature "destroying a current post" do
  scenario "successfully destroyed post" do

    sign_in(users(:one))
    visit posts_path

    click_on "New Post"
    fill_in "Title", with: "destroy this"
    fill_in "Body",  with: "from the editor"
    click_on "Create Post"
    post_id = current_url.split('/').last
    click_on "All Posts"
    click_link "Destroy", href: "/posts/#{post_id}"

    page.wont_have_content "destroy this"
  end
end
