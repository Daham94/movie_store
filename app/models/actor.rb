class Actor < ActiveRecord::Base
  belongs_to :actor_gender
  belongs_to :actor_country
  has_many :actors_videos
  has_many :videos, through: :actors_videos
  validates :name, presence: true
  validates :age, presence: true
  validates :actor_gender_id, presence: true
  validates :actor_country_id, presence: true
end
