class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone_number
      t.string :birthdate
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :zip
      t.string :state

      t.timestamps null: false
    end
  end
end
