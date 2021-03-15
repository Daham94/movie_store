class DropTableAdminGenresVideos < ActiveRecord::Migration[6.0]
  def change
    drop_table :admin_genres_videos
  end
end
