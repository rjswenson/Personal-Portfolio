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

  scenario "edit with invalid info" do
    Project.create(name: "First project", technologies_used: "Rails, Ruby, HTML5")

    visit edit_project_path(1)

    fill_in "Name", with: " "
    fill_in "Technologies used", with: " "
    click_on "Update Project"

    page.text.must_include "errors"
    page.text.must_include "Technologies used"
    page.text.must_include "Project could not be saved."
  end
end
