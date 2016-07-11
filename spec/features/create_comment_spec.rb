require "rails_helper"

RSpec.feature "Create a Comment" do
  scenario "Customer can leave additional information" do
    visit "/comments/new"

    user = create(:user)
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign in"

    subscriber = create(:subscriber)
    fill_in "comment_fav_drink", with: "Latte"
    click_button "Send"

    expect(page).to have_content("Thank you!")
  end
end
