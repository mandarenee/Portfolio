require "test_helper"

feature "Can Access Home" do
  scenario "has content" do
    visit root_path
    page.must_have_content "Software Engineer"
    page.must_have_content "Experience"
  end
end
