class CreateContentRatings < ActiveRecord::Migration[6.0]
  def self.up
    create_table :content_ratings do |t|
      t.string :name
      t.timestamps
    end
  end

  def self.down
    drop_table :content_ratings
  end
end
