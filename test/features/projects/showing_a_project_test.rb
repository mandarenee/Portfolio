require "test_helper"

feature "Create the spec file for showing a single project" do
  scenario "the test is sound" do
    project = Project.create(name: "First Project", technologies_used: "Rails, Ruby, HTML")
    visit project_path(project)
    page.must_have_content "First Project"
    page.wont_have_content "Pickles"
  end
end
