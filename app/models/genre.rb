class Genre < ActiveRecord::Base
  has_many :genres_videos
  has_many :videos, through: :genres_videos
  validates :name, presence: true
end
