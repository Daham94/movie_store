class CreateJoinTableGenresVideos < ActiveRecord::Migration[6.0]
  def change
    create_join_table :videos, :genres do |t|
       t.index [:video_id, :genre_id]
       t.index [:genre_id, :video_id]
    end
  end
end
