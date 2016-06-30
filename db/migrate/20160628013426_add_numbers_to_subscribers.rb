class AddNumbersToSubscribers < ActiveRecord::Migration
  def change
    add_column :subscribers, :mug_number, :integer
  end
end
