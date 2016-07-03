# Preview all emails at http://localhost:3000/rails/mailers/subscriber_mailer
class SubscriberMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/subscriber_mailer/subscription_confirmation
  def subscription_confirmation
    SubscriberMailer.subscription_confirmation
  end

end
