class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :description
      t.binary :thumbnail
      t.date :release_date
      t.integer :rating

      t.timestamps
    end
  end
end
