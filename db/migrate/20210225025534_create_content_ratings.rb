class CreateContentRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :content_ratings do |t|
      t.string :name

      t.timestamps
    end
  end
end
