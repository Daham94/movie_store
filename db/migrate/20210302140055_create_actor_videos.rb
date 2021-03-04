class CreateActorVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :actor_videos do |t|
      t.references :actor, null: false, foreign_key: true
      t.references :video, null: false, foreign_key: true

      t.timestamps
    end
  end
end
