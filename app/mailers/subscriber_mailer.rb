class SubscriberMailer < ApplicationMailer
  default from: "cam@rowstercoffee.com"
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.subscriber_mailer.welcome_subscriber.subject
  #
  def welcome_subscriber(subscriber)
    @subscriber = subscriber

    mail to: subscriber.email
  end
end
