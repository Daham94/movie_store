class CreateInventories < ActiveRecord::Migration[6.0]
  def change
    create_table :inventories do |t|
      t.float :price
      t.integer :total_copies
      t.string :barcode_no

      t.timestamps
    end
  end
end
