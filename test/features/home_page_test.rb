require "test_helper"

describe "The static home page" do
  it "exists" do
    visit "http://localhost:3000"
    page.text.must_include "Home"
  end
end

