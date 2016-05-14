class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :subtotal
      t.float :total
      t.float :shipping
      t.boolean :status
      t.text :receipt

      t.timestamps null: false
    end
  end
end
