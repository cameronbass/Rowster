require "rails_helper"

describe SubscribersController do
  include Devise::TestHelpers

  let(:user) { FactoryGirl.create(:user)}


  it "creates a new subscriber" do
    sign_in(user)
    subscriber = FactoryGirl.create(:subscriber)
    expect { post :create, :subscriber =>  subscriber }.to change(Subscriber, :count).by(1)
  end
end
