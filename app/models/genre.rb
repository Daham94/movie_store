class Genre < ApplicationRecord
  has_many :genres_videos
  has_many :videos, through: :genres_videos
end
