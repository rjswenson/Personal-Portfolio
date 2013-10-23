require "test_helper"

feature "visiting a single project show page" do
  scenario "with multiple projects listed" do
    Project.create(name: "Second Assignment",
                    technologies_used: "CSS")

    visit project_path(projects(:graffiti))
    page.text.must_include projects(:graffiti).name
    page.text.wont_include "Second Assignment"
    page.text.must_include projects(:graffiti).technologies_used
    page.text.wont_include "CSS"
  end
end
