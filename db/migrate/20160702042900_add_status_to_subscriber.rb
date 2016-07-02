class AddStatusToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :status, :string
  end
end
