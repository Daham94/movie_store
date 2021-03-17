class RemoveMediaTypeFromInventory < ActiveRecord::Migration[6.0]
  def change
    remove_reference :inventories, :media_type, null: false, foreign_key: true
  end
end
