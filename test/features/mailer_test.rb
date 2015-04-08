require "test_helper"

feature SignupMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers
  # if it doesn't work, move below scenario
  scenario "the test is sound" do
    visit root_path
    click_on "Contact me"
    fill_in "Name", with: "Peter Piper"
    fill_in "Email", with: "me@example.com"
    fill_in "Message", with: "Cool website. Can I hire you?"
    click_on "Submit"
    page.must_have_content "Thank you for your email"
    email = UserMailer.create_signup "mandareneekom@gmail.com", "Manda Kom"
    email.must deliver_to "mandareneekom@gmail.com"
  end
end
