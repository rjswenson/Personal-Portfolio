require "test_helper"

feature "The static home page" do
  scenario "exists" do
    visit root_path
    page.text.must_include "Robin"
  end
  scenario "has a functioning title" do
    visit root_path
    page.text.must_include "Portfolio"
  end
  scenario "deploys correctly via Heroku" do
    visit "http://robin-portfolio.herokuapp.com"
    page.text.must_include "Robin"
  end
end

