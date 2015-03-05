require "test_helper"

feature "Visiting the article index" do
  scenario "is on the right page" do
    visit "articles#index"
    page.must_have_content "Manda's Web Dev Blog"
    page.wont_have_content "puppies"
  end

  scenario "with existing posts" do
    # Given that there are existing posts
    Post.create(title: "First days as a Code Fellow",
        body:"It's hard, but it's worth it!")

    # When I visit '/posts'
    visit posts_path

    # Then the existing posts should be displayed
    page.text.must_include "First days as a Code Fellow"
  end
end
