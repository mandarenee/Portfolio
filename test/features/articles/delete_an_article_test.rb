require "test_helper"

feature "DeleteAnArticle" do
  scenario "Deleting drunken rants" do
    # Given an existing article
    sign_in(:user)
    create_article

    # When I click delete
    click_on "Delete Article"

    # The article will be deleted
    page.wont_have_content "Code Fellow"
  end

  scenario "Authors can delete THEIR OWN UNpublished articles" do
    sign_in(:one)
    create_article
    page.text.must_include "Delete"
  end

  scenario "Editors can delete articles" do
    sign_in(:user)
    create_article
    page.text.must_include "Delete"
  end

  scenario "Visitors CANNOT delete articles" do
    visit articles_path
    page.text.wont_include "Delete"
  end
end
