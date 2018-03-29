class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.float :shipping
      t.boolean :status
      t.text :receipt
      t.references  :store, index: true, foreign_key: true
      t.string :address
      t.references :customer,  index: true, foreign_key: true 

      t.timestamps null: false
    end
  end
end
