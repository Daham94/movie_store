class AddVideoRefToInventory < ActiveRecord::Migration[6.0]
  def change
    add_reference :inventories, :video, null: false, foreign_key: true
  end
end
