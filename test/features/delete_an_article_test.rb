require "test_helper"

feature "DeleteAnArticle" do
  scenario "Deleting drunken rants" do
    # Given an existing article
    article = Article.create(title: "First days as a Code Fellow",
        body:"It's hard, but it's worth it!")
    visit articles_path(article)

    # When I click delete
    click_on "Delete Article"

    # The article will be deleted
    page.wont_have_content "Code Fellow"
  end
end
