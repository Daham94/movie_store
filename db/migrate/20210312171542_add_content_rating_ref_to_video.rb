class AddContentRatingRefToVideo < ActiveRecord::Migration[6.0]
  def change
    add_reference :videos, :content_rating, null: true, foreign_key: true
  end
end
