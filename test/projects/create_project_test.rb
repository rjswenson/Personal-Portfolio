require "test_helper"

feature "As the site owner, I want to add a portfolio item" do
  scenario "adding a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "Code Fellows Portfolio"
    fill_in "Technologies used", with: "Rails, Ruby, Bootstrap, HTML5, CSS3"

    click_on "Create Project"
    page.text.must_include "Project was successfully added."
    page.text.must_include "Code Fellows Portfolio"
    page.text.must_include "Rails"
  end
end
