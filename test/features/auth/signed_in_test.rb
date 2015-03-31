require "test_helper"

feature "Signed In" do
  scenario "The user is signed in" do
    sign_in(:user)
    page.must_have_content "Signed in as"
    page.wont_have_content "Sign Up"
  end
end
