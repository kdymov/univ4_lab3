class CreateRecharges < ActiveRecord::Migration
  def change
    create_table :recharges do |t|
      t.integer :user_id
      t.integer :amount

      t.timestamps null: false

      t.foreign_key :users
    end
  end
end
