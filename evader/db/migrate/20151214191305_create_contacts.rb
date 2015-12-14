class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :customer, index: true
      t.string :type_cont 
      t.string :value_cont

      t.timestamps null: false
    end
  end
end
