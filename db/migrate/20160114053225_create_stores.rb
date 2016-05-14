class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.integer :phone
      t.string :address
      t.text :about
     

      t.timestamps null: false
    end
  end
end
