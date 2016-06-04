require "rails_helper"

describe SubscribersController do
<<<<<<< HEAD
  include Devise::TestHelpers

  let(:user) { FactoryGirl.create(:user)}


  it "creates a new subscriber" do
    sign_in(user)
    subscriber = FactoryGirl.create(:subscriber)
=======

  before do
    user = User.create!(email: "staff@example.com", password: "password")
    sign_in user
  end

  it "creates a new subscriber" do
    subscriber = Subscriber.create!(first_name: "John", last_name: "doe", email: "example@example.com", phone_number: "8269338")
>>>>>>> c5b2070e4826de3dd4e38ad75f16141a867232cf
    expect { post :create, :subscriber =>  subscriber }.to change(Subscriber, :count).by(1)
  end
end
