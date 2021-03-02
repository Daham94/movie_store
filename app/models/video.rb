class Video < ApplicationRecord
  has_and_belongs_to_many :actors
  belongs_to :content_rating
  has_many :inventories
  has_many :media_type, :through => :inventories
  has_and_belongs_to_many :genres
end
