class MediaType < ApplicationRecord
  has_many :inventories, dependent: :destroy
  has_many :videos, :through => :inventories
end
