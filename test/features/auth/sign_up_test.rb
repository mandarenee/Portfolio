require "test_helper"

feature "
  As a site visitor, I want to be able to sign up for an account,
  so that I can perform actions that require me to be logged in.
  " do
  scenario "sign up" do
    sign_up

    page.must_have_content "Welcome! You have signed up successfully"
    page.must_have_content "Signed in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "There was a problem with your sign up"
  end
end
