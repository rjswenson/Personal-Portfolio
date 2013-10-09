require "test_helper"

feature "The posts index" do
  scenario "an html should exist" do
    visit posts_path
    page.wont_be_empty
  end

  scenario "it has a title" do
    visit posts_path
    page.text.must_include "Posts"
  end

  scenario "it contains added posts" do
    Post.create(title: "Becoming a Code Fellow",
      body: "I worked really hard and now I win.")
    page.text.must_include "Becoming a Code Fellow"
    page.text.must_include "really hard"
  end
end
