require "test_helper"
# Site admins that can do everything, including marking articles as "published"
# feature "Editor permissions" do
#   scenario "Editors can read ALL UNpublished articles" do
#     create_other_article
#     sign_in(:author)
#     visit articles_path
#     create_article
#     page.text.must_include "it's worth it"
#     page.text.must_include "getting the hang of this"
#     page.wont_have_content "published"
#   end

#   scenario "Editors can read published articles" do
#     sign_in(:editor)
#     create_article
#     visit articles_path
#     page.must_include_content "published"
#   end

#   scenario "Editors can write articles" do
#     sign_in(:editor)
#     create_article
#     page.text.must_include "it's worth it"
#     page.text.must_include "Status: Unpublished"
#   end

#   scenario "Editors can publish" do
#     sign_in(:editor)
#     visit new_article_path
#     page.must_have_field('published')
#     fill_in "Title", with: articles(:cr).title
#     fill_in "Body", with: articles(:cr).body
#     check "Published"
#     click_on "Create Article"
#     page.text.must_include "Status: Published"
#   end

#   scenario "Editors can edit articles" do
#     sign_in(:editor)
#     visit article_path
#     page.text.must_include "Edit"
#   end

#   scenario "Editors can delete articles" do
#     sign_in(:editor)
#     visit article_path
#     page.text.must_include "Delete"
#   end
# end
