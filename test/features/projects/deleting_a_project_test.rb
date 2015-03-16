require "test_helper"

feature "Delete A Project" do
  scenario "Delete an existing projects" do
    # Given an existing article
    visit projects_path

    visit project_path(projects(:portfolio))
    # When I click delete
    click_on "Delete"

    # The article will be deleted
    page.wont_have_content "bootstrap"
  end
end
