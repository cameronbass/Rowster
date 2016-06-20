class AddSubscriberIdToComment < ActiveRecord::Migration
  def change
    add_column :comments, :subscriber_id, :integer
  end
end
