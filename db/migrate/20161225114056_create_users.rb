class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :login
      t.string :password
      t.string :fullname
      t.string :phone
      t.integer :tariff_id
      t.integer :balance
      t.boolean :is_blocked
      t.boolean :is_admin

      t.timestamps null: false

      t.foreign_key :tariffs
    end
  end
end
