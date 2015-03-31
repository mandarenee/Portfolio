require "test_helper"

feature "Sign up for an account" do
  scenario "sign up" do
    sign_up

    page.must_have_content "Welcome! You have signed up successfully"
    page.must_have_content "Signed in as"
    page.must_have_content "Sign Out"
    page.wont_have_content "There was a problem with your sign up"
  end
end
