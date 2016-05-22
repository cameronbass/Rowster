class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|
      t.integer :visit_amount
      t.boolean :active

      t.timestamps null: false
    end
  end
end
