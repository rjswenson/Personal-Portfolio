require "test_helper"

feature "Destroying a currently exisiting project" do
  scenario "clicking delete in our index" do
    project_1 = Project.create(name: "First Project", technologies_used: "Rails, Ruby")
    project_2 = Project.create(name: "Second Assignment", technologies_used: "CSS, HTML")

    visit projects_path
    click_link "Destroy", href: "/projects/#{project_1.id}"

    page.text.must_include "Project was successfully deleted."
    page.text.must_include "Second Assignment"
    page.text.wont_include "First Project"
  end
end
