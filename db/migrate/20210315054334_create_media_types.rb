class CreateMediaTypes < ActiveRecord::Migration[6.0]
  def self.up
    create_table :media_types do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :media_types
  end
end
