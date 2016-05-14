class AddPaperclipToStore < ActiveRecord::Migration
  def change
    add_attachment :stores, :image
  end
end
