class RemoveThumbnailFromVideos < ActiveRecord::Migration[6.0]
  def change
    remove_column :videos, :thumbnail, :binary
  end
end
