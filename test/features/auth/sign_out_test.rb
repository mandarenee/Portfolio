require "test_helper"

feature "
  As a visitor, I want to be able to sign out so that snoopy people
  can't see my account
" do
  scenario "sign out" do
    sign_in(:user)
    click_on "Sign Out"
    page.must_have_content "Signed out successfully"
    page.wont_have_content "Signed in"
  end
end
