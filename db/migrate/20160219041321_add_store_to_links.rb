class AddStoreToLinks < ActiveRecord::Migration
  def change
    add_reference :links, :store, index: true, foreign_key: true
  end
end
