class AddSubscriptionDateToSubscribers < ActiveRecord::Migration
  def change
    add_column :Subscribers, :subscription_date, :date
  end
end
