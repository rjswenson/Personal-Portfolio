require 'test_helper'

feature "Viewing the index list of projects" do
  scenario "with multiple projects listed" do
    Project.create(name: "First Project", technologies_used: "Rails, Ruby")
    Project.create(name: "Second Assignment", technologies_used: "CSS, HTML")

    visit projects_path
    page.text.must_include "First Project"
    page.text.must_include "Second Assignment"
    page.text.must_include "Rails"
    page.text.must_include "CSS"
  end
end

