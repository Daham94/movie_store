class ChangeActorVideosToActorsVideos < ActiveRecord::Migration[6.0]
  def change
    rename_table :actor_videos, :actors_videos
  end
end
