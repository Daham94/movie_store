class CreateJoinTableAdminGenresVideos < ActiveRecord::Migration[6.0]
  def change
    create_join_table :videos, :admin_genres do |t|
       t.index [:video_id, :admin_genre_id]
       t.index [:admin_genre_id, :video_id]
    end
  end
end
