class AddAttachmentThumbnailToVideos < ActiveRecord::Migration[6.0]
  def self.up
    change_table :videos do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :videos, :thumbnail
  end
end
