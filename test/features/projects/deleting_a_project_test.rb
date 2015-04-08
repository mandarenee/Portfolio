require "test_helper"

feature "Delete A Project" do
  scenario "Delete an existing projects" do
    # Given an existing article
    project = Project.create(name: "First Project", technologies_used: "Rails, Ruby, HTML")
    visit project_path(project)

    visit project_path(projects(:portfolio))
    # When I click delete
    click_on "Delete"

    # The article will be deleted
    page.wont_have_content "bootstrap"
  end
end
