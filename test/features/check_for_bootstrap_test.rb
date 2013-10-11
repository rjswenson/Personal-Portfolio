require "test_helper"

feature "Bootstrap functionality" do
  scenario "is within the root_path" do
    visit root_path
    page.body.must_include('navbar')
  end
end
