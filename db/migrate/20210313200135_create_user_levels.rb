class CreateUserLevels < ActiveRecord::Migration[6.0]
  def self.up
    create_table :user_levels do |t|
      t.string :level
      t.timestamps
    end
  end

  def self.down
    drop_table :user_levels
  end
end
