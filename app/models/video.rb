class Video < ApplicationRecord
  searchkick
  has_many :actors_videos
  has_many :actors, through: :actors_videos
  #accepts_nested_attributes_for :actor_videos, allow_destroy: true
  belongs_to :content_rating
  has_many :inventories, dependent: :destroy
  has_many :media_type, :through => :inventories
  has_many :genres_videos, dependent: :destroy
  has_many :genres, :through => :genres_videos
  has_many :customers, :through => :reviews
  has_many :reviews, dependent: :destroy
  has_attached_file :thumbnail, styles: {medium: "200*300"}
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
