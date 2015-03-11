require "test_helper"

feature "DeleteAProject" do
  scenario "Deleting projects" do
    # Given an existing article
    project = Project.create(name: "First Project",
        technologies_used: "Rails, Ruby, HTML")
    visit projects_path

    # When I click delete
    click_on "Delete"

    # The article will be deleted
    page.wont_have_content "First Project"
  end
end
