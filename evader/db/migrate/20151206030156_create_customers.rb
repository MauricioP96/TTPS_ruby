class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :last_name
      t.date :birthdate
      t.string :gender
      t.integer :dni
      t.string :cu_type
      t.string :cu_value
      t.timestamps null: false
    end
    add_index :customers
  end
end
