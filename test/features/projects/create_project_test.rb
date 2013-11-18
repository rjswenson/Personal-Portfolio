require "test_helper"

feature "Within the projects..." do
  scenario "adding a new", js: true do
    sign_in(users(:editor))
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "Sweet Stuff"
    fill_in "Technologies used", with: "Chocolate"
    click_on "Create Project"
    page.text.must_include "Sweet Stuff"
    page.text.must_include "Chocolate"
  end

  scenario "with invalid data" do
    sign_in(users(:editor))
    visit new_project_path
    fill_in "Name", with: "Q"
    click_on "Create Project"

    # current_path.must_match /projects$/
    page.text.must_include "Project could not be saved."
    page.text.must_include "Name is too short"
    page.text.must_include "Technologies used can't be blank"
  end
end
