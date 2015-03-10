require "test_helper"

feature "As site owner, I want to add a portfolio to show my work" do
  scenario "Add a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "My Project"
    fill_in "Technologies used", with: "Ruby, Rails"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?("#notice"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end
end
