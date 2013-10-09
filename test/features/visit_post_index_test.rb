require "test_helper"

feature "The posts index" do
  scenario "an html should exist" do
    visit posts_path
  end

  scenario "it has a title" do
    visit posts_path
    page.text.must_include "posts"
  end

  scenario "it contains added posts" do
    Post.create(title: "Becoming a Code Fellow",
      body: "I worked really hard and now I win.")
    visit posts_path

    page.text.must_include "Becoming a Code Fellow"
    page.text.must_include "really hard"
  end
end
