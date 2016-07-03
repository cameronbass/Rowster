require "rails_helper"

RSpec.describe SubscriberMailer, type: :mailer do
  describe "welcome_subscriber" do
    let(:mail) { SubscriberMailer.welcome_subscriber }

    it "renders the headers" do
      expect(mail.subject).to eq("Welcome subscriber")
      expect(mail.to).to eq(["to@example.org"])
      expect(mail.from).to eq(["from@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
