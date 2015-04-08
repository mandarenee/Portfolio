require "test_helper"

feature "Visiting the article index" do
  scenario "with existing posts" do
    # Given that there are existing posts
    sign_in(:user)
    create_article
    # check "Published"

    # When I visit '/posts'
    visit articles_path

    # Then the existing posts should be displayed
    page.text.must_include "First days as a Code Fellow"
  end

  scenario "
    Authors can read THEIR OWN UNpublished articles, but not those written by others
  " do
    sign_in(:one)
    create_article
    click_on "Sign Out"
    sign_in(:two)
    visit new_article_path
    fill_in "Title", with: "Been in school a little while"
    fill_in "Body", with: "I'm getting the hang of this"
    click_on "Create Article"
    visit articles_path
    page.text.must_include "Been in school"
    page.wont_have_content "First days"
    page.wont_have_content "published"
  end

  scenario "Editors can read ALL UNpublished articles" do
    sign_in(:one)
    create_article
    click_on "Sign Out"
    sign_in(:user)
    visit articles_path
    page.text.must_include "First days"
  end

  scenario "Visitors can read published articles" do
    visit articles_path
    page.text.must_include "Published"
  end

  scenario "Visitors CANNOT see the UNpublished articles index" do
    sign_in(:one)
    create_article
    click_on "Sign Out"
    visit articles_path
    page.wont_have_content "Unpublished"
  end

  scenario "Visitors CANNOT see UNpublished articles" do
    sign_in(:one)
    create_article
    click_on "Sign Out"
    visit "/articles/first-days-as-a-code-fellow"
    page.wont_have_content "You need to sign in or sign up before continuing"
  end
end
