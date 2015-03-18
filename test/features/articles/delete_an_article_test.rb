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
end
