require "rails_helper"

  describe CommentsController do
    include Devise::TestHelpers

    let(:user) { create(:user) }
    let(:subscriber) { create(:subscriber) }

    it "creates a new comment" do
      sign_in(user)
      comment = attributes_for(:comment)

      expect { post :create, subscriber: subscriber, comment: comment }.to change{ Comment.count }.by(1)
    end
  end
