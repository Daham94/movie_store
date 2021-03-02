class Inventory < ApplicationRecord
  belongs_to :video
  belongs_to :media_type
  has_many :movie_stocks
end
