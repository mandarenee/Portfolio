require "test_helper"

feature "Edit An Article" do
  scenario "make changes to an existing article" do
    # Given a posted Article
    sign_in(:user)
    create_article

    # When I click edit and submit changes
    click_on "Edit Article"
    fill_in "Title", :with => "First days as a Code Fellow student"
    click_on "Update Article"

    # Then I make saved updates to article
    page.must_have_content "Article was successfully updated."
    page.must_have_content "Code Fellow student"
  end

  scenario "Authors can edit THEIR OWN UNpublished articles" do
    sign_in(:one)
    create_article
    page.text.must_include "Edit"
  end

  scenario "Editors can edit all articles" do
    create_other_article
    sign_in(:user)
    visit articles_path
    page.text.must_include "Edit"
  end

end
