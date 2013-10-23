require "test_helper"

feature "As a site owner, edit a project" do
  scenario "edit an existing project" do

    visit edit_project_path(projects(:graffiti))

    fill_in "Name", with: "My Rad Portfolio"
    click_on "Update Project"

    page.text.must_include "successfully updated."
    page.text.must_include "Rad Portfolio"
    page.text.wont_include "#{projects(:graffiti).name}"
  end

  scenario "edit with invalid info" do

    visit edit_project_path(projects(:graffiti))

    fill_in "Name", with: " "
    fill_in "Technologies used", with: " "
    click_on "Update Project"

    page.text.must_include "errors"
    page.text.must_include "Technologies used"
    page.text.must_include "Project could not be saved."
  end
end
