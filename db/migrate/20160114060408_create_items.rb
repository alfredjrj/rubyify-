class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :price
      t.integer :quantity
      t.string :name
      t.text :description
      t.string :sku
      t.boolean :inventory
      

      t.timestamps null: false
    end
  end
end
