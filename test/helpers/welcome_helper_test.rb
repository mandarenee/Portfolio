require "test_helper"

describe "Welcome page has content", :capybara do
  it "must include the name 'Amanda'" do
    visit root_path
    page.must_have_content "Amanda"
  end
end
