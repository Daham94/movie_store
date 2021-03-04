class Actor < ApplicationRecord
  has_many :actor_videos
  has_many :videos, through: :actors_videos
  belongs_to :actor_gender
  belongs_to :actor_country
end
