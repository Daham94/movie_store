class AddMediaTypeRefToInventory < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :media_type, null: false, foreign_key: true
  end
end
