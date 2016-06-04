require "rails_helper"

  describe SubscribersController do
    include Devise::TestHelpers

    let(:user) { FactoryGirl.create(:user)}

    it "creates a new subscriber" do
      sign_in(user)
      subscriber = FactoryGirl.attributes_for(:subscriber)

      expect { post :create, :subscriber =>  subscriber }.to change(Subscriber, :count).by(1)
    end

    it "adds 1 to the visit attribute" do
      sign_in(user)
      subscriber = FactoryGirl.create(:subscriber)
      post :visit, phone_number: subscriber.phone_number
      subscriber.reload

      expect(subscriber.visit).to eq(1)
    end
  end
