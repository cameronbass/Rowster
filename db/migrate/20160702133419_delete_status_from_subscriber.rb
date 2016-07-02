class DeleteStatusFromSubscriber < ActiveRecord::Migration
  def change
    remove_column :Subscribers, :status
  end
end
