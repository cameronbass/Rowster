require "rails_helper"

RSpec.feature "Create a subscriber" do
  scenario "Customer can sign up as a subscriber" do
    visit "/subscribers/new"

    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    fill_in "subscriber_first_name", with: "Cam"
    fill_in "subscriber_last_name", with: "Bass"
    fill_in "subscriber_email", with: "cam@example.com"
    fill_in "subscriber_phone_number", with: "6168269338"
    click_button "Sign Up"

    expect(page).to have_content("Subscriber Has Been Successfully Created")
  end

  scenario "Subscriber can sign in" do
    visit "/subscribers/search"

    user = FactoryGirl.create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    subscriber = FactoryGirl.create(:subscriber)

    fill_in "phone_number", with: "6168765555"
    click_button "Check In"

    expect(page).to have_content("Thank You #{subscriber.first_name}. You have #{subscriber.days_till_expired} until renewal")
  end
end
