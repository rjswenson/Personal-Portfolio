require "test_helper"

describe "The static home page" do
  it "exists" do
    visit "http://localhost:3000"
    page.text.must_include "Home"
  end
  it "has a functioning title" do
    visit "http://localhost:3000"
    page.text.must_include "Portfolio"
  end
end

