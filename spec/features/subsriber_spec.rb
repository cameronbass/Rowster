require "rails_helper"

RSpec.feature "Create a subscriber" do
  let(:subscriber) { FactoryGirl.create(:subscriber) }

  it "Customer can sign up as a subscriber" do
    visit "/subscribers/new"

    user = create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    fill_in "subscriber_first_name", with: "Cam"
    fill_in "subscriber_last_name", with: "Bass"
    fill_in "subscriber_email", with: "cam@rowster.com"
    fill_in "subscriber_phone_number", with: "6168269338"
    click_button "Sign Up"

    expect(page).to have_content("Subscriber Has Been Successfully Created")
  end

  it "Subscriber can sign in" do
    visit "/subscribers/search"

    user = create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    subscriber = create(:subscriber)

    fill_in "phone_number", with: "6168765555"
    click_button "Check In"

    expect(page).to_not have_content("thanks")
  end

  it "allows user to delete a subscriber" do
    subscriber = create(:subscriber)

    visit "/subscribers/#{subscriber.id}"

    user = create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    click_button "delete"

    expect(current_path).to eq(root_path)
    expect(page).to have_content("Subscriber has been deleted")
  end
end
