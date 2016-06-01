require "rails_helper"

describe SubscribersController do

  before do
    user = User.create!(email: "staff@example.com", password: "password")
    sign_in user
  end

  it "creates a new subscriber" do
    subscriber = Subscriber.create!(first_name: "John", last_name: "doe", email: "example@example.com", phone_number: "8269338")
    expect { post :create, :subscriber =>  subscriber }.to change(Subscriber, :count).by(1)
  end
end
