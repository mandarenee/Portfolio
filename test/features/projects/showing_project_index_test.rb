require "test_helper"

feature "As the site visitor, I was to see a developer's portfolio" do
  scenario "viewing all projects" do
    # Given a couple of projects (loaded from fixtures)
    Project.create(name: "Barnyard Cereal", technologies_used: "Ruby, Rails")
    # When I visit /projects
    visit projects_path

    # Then I should see a list of projects
    page.text.must_include "Barnyard Cereal"
    page.text.must_include "Ruby, Rails"
  end
end
