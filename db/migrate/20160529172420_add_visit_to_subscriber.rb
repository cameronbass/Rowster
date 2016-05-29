class AddVisitToSubscriber < ActiveRecord::Migration
  def change
    add_column :subscribers, :visit, :integer
  end
end
