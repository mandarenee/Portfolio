ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails/capybara"
require "minitest/pride"
require "minitest-matchers"
require "email_spec"

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!

  fixtures :all

  def create_projects(project)
    visit projects_path
    click_on "New project"

    fill_in "Name", with: project.name
    fill_in "Technologies used", with: project.technologies_used

    click_on "Create Project"
  end

  def sign_up
    visit root_path
    click_on "Sign Up"
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_on "Sign up"
  end

  def sign_in(role = :editor)
    visit new_user_session_path
    fill_in "Email", with: users(role).email
    fill_in "Password", with: 'password'
    click_on "Log in"
  end

  def create_article
    visit new_article_path
    fill_in "Title", with: "First days as a Code Fellow"
    fill_in "Body", with: "It's hard, but it's worth it!"
    click_on "Create Article"
  end

  def create_pub_article
    visit new_article_path
    fill_in "Title", with: "First days as a Code Fellow"
    fill_in "Body", with: "It's hard, but it's worth it!"
    check "Published"
    click_on "Create Article"
  end

  def create_other_article
    sign_in(:editor)
    visit new_article_path
    fill_in "Title", with: "Been in school a little while"
    fill_in "Body", with: "I'm getting the hang of this"
    click_on "Create Article"
    click_on "Sign Out"
  end
end
