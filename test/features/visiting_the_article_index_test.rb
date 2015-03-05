require "test_helper"

feature "Visiting the article index" do
  scenario "with existing posts" do
    # Given that there are existing posts
    Article.create(title: "First days as a Code Fellow",
        body:"It's hard, but it's worth it!")

    # When I visit '/posts'
    visit articles_path

    # Then the existing posts should be displayed
    page.text.must_include "First days as a Code Fellow"
  end
end
