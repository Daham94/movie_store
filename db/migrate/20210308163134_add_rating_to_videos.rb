class AddRatingToVideos < ActiveRecord::Migration[6.0]
  def change
    add_column :videos, :rating, :integer
  end
end
