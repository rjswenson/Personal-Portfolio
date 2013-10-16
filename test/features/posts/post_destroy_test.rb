require "test_helper"

feature "destroying a current post" do
  scenario "successfully destroyed post" do

    sign_in

    visit posts_path
    click_on 'Destroy'

    visit posts_path
    page.text.wont_include "My first post"
    page.text.wont_include "Example details of post"
  end
end
