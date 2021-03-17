class DropTableMediaTypes < ActiveRecord::Migration[6.0]
  def change
    drop_table :media_types
  end
end
