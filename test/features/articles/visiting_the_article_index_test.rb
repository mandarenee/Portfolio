require "test_helper"

feature "Visiting the article index" do
  scenario "with existing posts" do
    # Given that there are existing posts
    sign_in(:user)
    visit new_article_path

    fill_in "Title", :with => "First days as a Code Fellow"
    fill_in "Body", :with => "It's hard, but it's worth it!"
    click_on "Create Article"
    # check "Published"

    # When I visit '/posts'
    visit articles_path

    # Then the existing posts should be displayed
    page.text.must_include "First days as a Code Fellow"
  end
end
