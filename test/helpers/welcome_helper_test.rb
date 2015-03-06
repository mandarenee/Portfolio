require "test_helper"

describe "Welcome page has content", :capybara do
  it "must include the name 'Manda'" do
    visit root_path
    page.must_have_content "Manda's Page"
  end
end
