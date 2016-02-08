class CreateBills < ActiveRecord::Migration
  def change
    create_table :bills do |t|
      t.belongs_to :client, index: true
      t.string :details
      t.float :amount
      t.date :date
      t.string :receiver
      t.string :cuit_l
      t.timestamps null: false
    end
  end
end
