class AddChangeToComments < ActiveRecord::Migration
  def change
    add_column :comments, :fav_drink, :string
    add_column :comments, :visit_time, :string
  end
end
