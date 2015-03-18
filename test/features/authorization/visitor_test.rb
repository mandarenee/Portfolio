require "test_helper"
# # default user type, they can only view published articles
# feature "Visitor permissions" do
#   scenario "Visitors can read published articles" do
#     create_other_article
#     visit articles_path
#     page.text.must_include "I'm getting the hang of this"
#   end

#   scenario "Visitors CANNOT see the UNpublished articles index" do
#     create_other_article
#     visit articles_path
#     page.must_have_content "You need to sign in or sign up before continuing"
#   end

#   scenario "Visitors CANNOT see UNpublished articles" do
#     visit article_path
#     page.must_have_content "You need to sign in or sign up before continuing"
#   end

#   scenario "Visitors CANNOT see new article button" do
#     visit articles_path
#     page.wont_have_link "New article"
#   end

#   scenario "Visitors CANNOT write articles" do
#     visit new_article_path
#     page.must_have_content "You need to sign in or sign up before continuing"
#   end

#   scenario "Visitors CANNOT edit articles" do
#     visit edit_article_path
#     page.must_have_content "You need to sign in or sign up before continuing"
#   end

#   scenario "Visitors CANNOT delete articles" do
#     visit article_path
#     page.wont_include_content "Delete"
#   end
# end
