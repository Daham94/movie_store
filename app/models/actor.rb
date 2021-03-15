class Actor < ActiveRecord::Base
  #attr_accessible :name, :age
  belongs_to :actor_gender
  belongs_to :actor_country
  has_many :actors_videos
  has_many :videos, through: :actors_videos
end
