require "test_helper"

feature "A user is flagged as editor" do

  scenario "they can create posts" do
    sign_in(users(:editor))

    visit new_post_path

    fill_in "Title", with: "Messy nonsense"
    fill_in "Body", with: "Easy to type"
    click_on "Create Post"

    visit posts_path
    page.text.must_include "Messy nonsense"
    page.text.must_include "Easy to type"

  end

  scenario "they can delete posts" do
    sign_in(users(:editor))

    visit posts_path
    click_on "New Post"
    fill_in "Title", with: "destroy this"
    fill_in "Body",  with: "from the editor"
    click_on "Create Post"

    post_id = current_url.split('/').last
    click_on "Back"
    click_link "Destroy", href: "/posts/#{post_id}"

    page.wont_have_content "destroy this"
  end

  scenario "they can publish posts" do
    sign_in(users(:editor))

    p = Post.create(title: "One", body: "Yup",
                        published: false)

    p.publish!

    visit posts_path

    page.text.must_include "One"
    page.text.must_include "Yup"
  end

  scenario "they can edit posts" do
    sign_in(users(:editor))

    visit edit_post_path(posts(:fp).id)

    fill_in "Title", with: "Messy nonsense"
    fill_in "Body", with: "Easy to type"
    click_on "Update Post"

    visit posts_path

    page.text.must_include "Messy nonsense"
    page.text.must_include "Easy to type"
    page.text.wont_include "#{posts(:fp).title}"
  end

  scenario "they can see all pre-published posts" do
    sign_in(users(:editor))

    p = Post.create(title: "Test title", body: "Blah",
                    published: false)

    visit posts_path

    page.text.must_include "#{p.title}"
    page.text.must_include "#{p.body}"
  end
end
