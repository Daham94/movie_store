class Actor < ApplicationRecord
  has_and_belongs_to_many :videos
  belongs_to :actor_gender
  belongs_to :actor_country
end
