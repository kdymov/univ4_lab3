class CreateTariffs < ActiveRecord::Migration
  def change
    create_table :tariffs do |t|
      t.string :name
      t.string :description
      t.integer :cost

      t.timestamps null: false
    end
  end
end
