require "test_helper"

feature "visiting a single project show page" do
  scenario "with multiple projects listed" do
    Project.create(name: "First Project", technologies_used: "Rails, Ruby")
    Project.create(name: "Second Assignment", technologies_used: "CSS, HTML")

    visit project_path(1)
    page.text.must_include "First Project"
    page.text.wont_include "Second Assignment"
    page.text.must_include "Rails"
    page.text.wont_include "CSS"
  end
end
