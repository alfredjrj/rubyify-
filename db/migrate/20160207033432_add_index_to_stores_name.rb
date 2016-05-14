class AddIndexToStoresName < ActiveRecord::Migration
  def change
     add_index :stores, :name, unique: true
  end
end
