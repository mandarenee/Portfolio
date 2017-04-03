require "test_helper"

feature "Comments On Articles" do
  scenario "visitors post comments on article" do
    create_other_article
    # As a site visitor,
    visit article_path("been-in-school-a-little-while")
    # I want to write a comment on a blog article page
    click_on "Comment"
    fill_in "Commenter name"
    fill_in "Content", with: "Awesome blog!"
    click_on "Post comment"
    # so that I can troll the author
    page.must_have_content "Awesome blog"
  end

# Editor's "rights"
  scenario "editor approves comments on article" do
    sign_in(:one)
    create_article
    sign_out
    visit article_path("first-days-as-a-code-fellow")
    click_on "Comment"
    fill_in "Content", with: ''
    page.must_have_content "Approved"
  end

  scenario "editor can write comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "editor can see unapproved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "editor can see approved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

# Author's "rights"
  scenario "author cannot approve comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "author can write unapproved comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "author can only see their own unapproved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "author can see approved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

# Twitter visitor's "rights"
  scenario "twitter visitor cannot approve comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "twitter visitor can write unapproved comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "twitter visitor can only see their own unapproved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "twitter visitor can see approved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

# Site visitor's "rights"
  scenario "site visitor cannot approve comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "site visitor cannot write unapproved comments on article" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end

  scenario "site visitor can see approved comments on articles" do
    create_other_article
    sign_in(:user)
    visit article_path("been-in-school-a-little-while")
    page.must_have_content "Approved"
  end
end
