class SubscribeUserToMailingListJob < ActiveJob::Base
  queue_as :default

  def perform(subscriber)
    gb = Gibbon::API.new(Figaro.env.mailchimp_api_key)
    gb.lists.subscribe({:id => ENV["MAILCHIMP_LIST_ID"], :email => {:email => subscriber.email}, :merge_vars => {:FNAME => subscriber.first_name, :LNAME => subscriber.last_name}, :double_optin => false})
  end
end
