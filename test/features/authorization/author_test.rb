require "test_helper"
# Can write articles, but not publish them
# feature "Author permissions" do
#   scenario "Authors can write articles, but not publish them" do
#     sign_in(:author)
#     create_article
#     page.text.must_include "it's worth it"
#     page.text.must_include "Status: Unpublished"
#   end

#   scenario "
#   Authors can read THEIR OWN UNpublished articles, but not those written by others
#   " do
#     create_other_article

#     sign_in(:author)
#     visit articles_path
#     page.text.must_include "it's worth it"
#     page.wont_have_content "getting the hang of this"
#     page.wont_have_content "published"
#   end

#   scenario "Authors can read published articles" do
#     sign_in(:author)
#   end

#   scenario "Authors can edit THEIR OWN UNpublished articles" do
#     sign_in(:author)
#     visit article_path
#     page.text.must_include "Edit"
#   end

#   scenario "Authors can delete THEIR OWN UNpublished articles" do
#     sign_in(:author)
#     visit article_path
#     page.text.must_include "Delete"
#   end
# end
