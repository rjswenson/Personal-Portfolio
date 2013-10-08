require "test_helper"

describe "The static home page" do
  it "exists" do
    visit('/localhost:3000/index')
    page.text.include("home")
  end
end

