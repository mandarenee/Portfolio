require "test_helper"

feature "As the site visitor, I want to see a developer's portfolio" do
  scenario "viewing all projects" do
    # Given a couple of projects (loaded from fixtures)
    create_projects(projects(:portfolio))
    # When I visit /projects
    visit projects_path

    # Then I should see a list of projects
    page.must_have_content "Ruby, Rails, Bootstrap"
    page.must_have_content "Farmville API, Automilker"
  end
end
