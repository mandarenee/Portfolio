require "test_helper"

feature "As site owner, I want to add a portfolio to show my work" do
  scenario "Add a new project" do
    visit projects_path
    click_on "New project"
    fill_in "Name", with: "My Project"
    fill_in "Technologies used", with: "Ruby, Rails"
    click_on "Create Project"
    page.text.must_include "Project has been created"
    assert page.has_css?(".alert-info"), "Expected a flash notice on this page, none found."
    page.status_code.must_equal 200
  end

  scenario "new project has invalid data" do
    visit projects_path
    click_on "New project"
    # Given invalid project data is entered into a form
    fill_in "Name", with: "Q"
    # When the form is submitted with a short name and missing technologies_used field
    click_on "Create Project"
    # Then the form should be displayed again, with an error message
    current_path.must_match /projects$/
    page.text.must_include "prohibited this project from being saved"
    page.text.must_include "That's too short!"
    page.text.must_include "Technologies used can't be blank"
  end
end
