require "test_helper"

feature "As the site owner, I want to edit a project so that I can correct typos" do
  # scenario "editing an existing project" do
  #   # Given an existing project
  #   visit edit_project_path(projects(:portfolio))

  #   # When I make changes
  #   fill_in "Name", with: "My First Portfolio"
  #   click_on "Update Project"

  #   # Then the changes should be saved and shown
  #   page.text.must_include "Project was successfully updated."
  #   page.text.must_include "First Portfolio"
  #   page.text.wont_include "Code Fellows"
  # end

  # scenario "incorrectly editing an existing project" do
  #   # Given an existing project# When I submit invalid changes
  #   visit edit_project_path(projects(:portfolio))

  #   # When I submit invalid changes
  #   fill_in "Name", with: "Err"
  #   click_on "Update Project"

  #   # Then the changes should not be saved, and I should get to try again
  #   page.text.must_include "prohibited"
  #   page.text.must_include "That's too short"
  # end
end
