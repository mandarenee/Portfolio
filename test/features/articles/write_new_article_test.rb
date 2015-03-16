require "test_helper"

feature "Write New Article" do
  def setup
      @user = users(:user)
  end

  scenario "submit form data to create new article" do
    # Given post is created
    sign_in(users(:user))
    visit new_article_path

    fill_in "Title", :with => "First days as a Code Fellow"
    fill_in "Body", :with => "It's hard, but it's worth it!"

    # When I submit the form
    click_on "Create Article"

    # Then the article should be created and displayed
    page.must_have_content "Article was successfully created"
    page.must_have_content "it's worth it"
    page.text.must_include users(:user).email
  end
end
