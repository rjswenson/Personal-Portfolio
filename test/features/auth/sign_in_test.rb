require "test_helper"

feature "Sign in an existing user" do
  scenario "with valid information" do

   user1 = User.create(email: "email@example.com", password: "password123",
                  password_confirmation: "password123")

    visit root_path
    click_link "Sign in"
    fill_in "Email", with: user1.email
    fill_in "Password", with: user1.password
    click_button "Sign in"

    page.text.must_include "Sign out"
    page.text.wont_include "Sign in"
    page.text.wont_include "Sign up"
  end

  scenario "sign in with twitter works" do
    visit root_path
    click_on "Sign In"
    OmniAuth.config.test_mode = true
    Capybara.current_session.driver.request.env['devise.mapping'] =
                                                      Devise.mappings[:user]

    Capybara.current_session.driver.request.env['omniauth.auth'] =
                                                      OmniAuth.config.mock_auth[:twitter]

    OmniAuth.config.add_mock(:twitter, { uid: '12345', info: { nickname: 'test_twitter_user'}, })
    click_on "Sign in with Twitter"
    page.must_have_content "test_twitter_user, you are signed in!"
  end
end
