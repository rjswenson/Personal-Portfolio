require "test_helper"

feature "As a site owner, edit a project" do
  scenario "edit an existing project" do
    Project.create(name: "First project", technologies_used: "Rails, Ruby, HTML5")

    visit edit_project_path(1)

    fill_in "Name", with: "My Rad Portfolio"
    click_on "Update Project"

    page.text.must_include "successfully updated."
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "Code Fellows Portfolio"
  end
end
