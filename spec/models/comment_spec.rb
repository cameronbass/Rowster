require "rails_helper"

describe Comment do
  context "association" do
    it { is_expected.to belong_to(:subscriber) }
  end
end
