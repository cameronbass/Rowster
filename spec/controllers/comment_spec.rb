require "rails_helper"

  describe CommentsController do
    include Devise::TestHelpers

    let(:user) { FactoryGirl.create(:user) }
    let(:subscriber) { FactoryGirl.create(:subscriber) }

    it "creates a new comment" do
      sign_in(user)
      comment = FactoryGirl.attributes_for(:comment)

      expect { post :create, subscriber: subscriber, comment: comment }.to change{ Comment.count }.by(1)
    end
  end
