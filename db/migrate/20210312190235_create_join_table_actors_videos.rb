class CreateJoinTableActorsVideos < ActiveRecord::Migration[6.0]
  def change
    create_join_table :videos, :actors do |t|
       t.index [:video_id, :actor_id]
       t.index [:actor_id, :video_id]
    end
  end
end
