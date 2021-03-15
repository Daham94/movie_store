class DropTableUserLevels < ActiveRecord::Migration[6.0]
  def change
    drop_table :user_levels
  end
end
