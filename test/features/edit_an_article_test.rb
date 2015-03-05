require "test_helper"

feature "Edit An Article" do
  scenario "make changes to an existing article" do
    # Given a posted Article
    article = Article.create(title: "First days as a Code Fellow",
        body:"It's hard, but it's worth it!")
    visit articles_path(article)

    # When I click edit and submit changes
    click_on "Edit Article"
    fill_in "Title", :with => "First days as a Code Fellow student"
    click_on "Update Article"

    # Then I make saved updates to article
    page.must_have_content "Article was successfully updated."
    page.must_have_content "Code Fellow student"
  end
end
