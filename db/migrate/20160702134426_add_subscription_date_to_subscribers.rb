class AddSubscriptionDateToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :subscription_date, :date
  end
end
