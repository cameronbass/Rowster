class SubscriberMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.subscription_confirmation.subject
  #
  def subscription_confirmation(subscriber)
    @subscriber = subscriber.email

    mail to: subscriber.email, subject: "Subscriber Confirmation"
  end
end
