class DeleteColumnsFromSubscribers < ActiveRecord::Migration
  def change
    remove_column :subscribers, :street_1, :string
    remove_column :subscribers, :street_2, :string
    remove_column :subscribers, :city, :string
    remove_column :subscribers, :state, :string
    remove_column :subscribers, :zip, :string
    remove_column :subscribers, :birthdate, :string
  end
end
