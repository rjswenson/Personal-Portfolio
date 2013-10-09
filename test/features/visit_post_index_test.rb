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
    Post.create(title: posts(:fp).title,
      body: posts(:fp).body)
    visit posts_path

    page.text.must_include posts(:fp).title
    page.text.must_include posts(:fp).body
  end
end
