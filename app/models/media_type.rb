class MediaType < ApplicationRecord
  has_many :inventories
  has_many :videos, :through => :inventories
end
