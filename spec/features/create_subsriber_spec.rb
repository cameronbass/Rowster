require "rails_helper"

RSpec.feature "Create a subscriber" do
  scenario "Customer can sign up as a subscriber" do
    visit "/subscribers/new"

    user = User.create!(email: "user@example.com", password: "password")
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    click_button "Sign in"

    fill_in "subscriber_first_name", with: "Cam"
    fill_in "subscriber_last_name", with: "Bass"
    fill_in "subscriber_email", with: "cam@example.com"
    fill_in "subscriber_phone_number", with: "8269338"
    click_button "Sign Up"

    expect(page).to have_content("Subscriber Has Been Successfully Created")
  end
end
