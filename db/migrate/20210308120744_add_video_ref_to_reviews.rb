class AddVideoRefToReviews < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :video, null: false, foreign_key: true
  end
end
