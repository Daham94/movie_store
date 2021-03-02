class CreateActorVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_videos do |t|

      t.timestamps
    end
  end
end
