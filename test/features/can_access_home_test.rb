require "test_helper"

feature "Can Access Home" do
  scenario "has content" do
    visit root_path
    page.must_have_content "About Me"
    page.must_have_content "Recent Posts"
  end
end
