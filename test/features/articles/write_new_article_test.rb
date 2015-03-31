require "test_helper"

feature "Write New Article" do
  scenario "submit form data to create new article" do
    # Given post is created
    sign_in(:one)
    visit new_article_path

    fill_in "Title", :with => "First days as a Code Fellow"
    fill_in "Body", :with => "It's hard, but it's worth it!"

    # When I submit the form
    click_on "Create Article"

    # Then the article should be created and displayed
    page.must_have_content "Article was successfully created"
    page.must_have_content "it's worth it"
    page.text.must_include "test1@test.com"
    page.text.must_include "Status: Unpublished"
  end

  scenario "Visitors cannot write articles" do
    visit articles_path
    page.wont_have_link "New article"
  end

  scenario "Authors can't publish" do
    sign_in(:one)
    visit new_article_path
    page.wont_have_field "published"
  end

  scenario "Editors can publish" do
    sign_in(:user)
    visit new_article_path
    page.must_have_field('Published')
    fill_in "Title", with: articles(:UserTest).title
    fill_in "Body", with: articles(:UserTest).body
    check "Published"
    click_on "Create Article"
    page.text.must_include "Status: Published"
  end

  scenario "Authors can read published articles" do
    create_other_article
    sign_in(:one)
    visit articles_path
    page.text.must_include "Published"
  end

  scenario "Editors can write articles" do
    sign_in(:user)
    create_pub_article
    page.text.must_include "it's worth it"
    page.text.must_include "Status: Published"
  end

  scenario "Editors can publish" do
    sign_in(:editor)
    visit new_article_path
    page.must_have_field('Published')
    fill_in "Title", with: articles(:UserUnpublished).title
    fill_in "Body", with: articles(:UserUnpublished).body
    check "Published"
    click_on "Create Article"
    page.text.must_include "Status: Published"
  end

  scenario "Visitors CANNOT see new article button" do
    visit articles_path
    page.wont_have_link "New article"
  end
end
