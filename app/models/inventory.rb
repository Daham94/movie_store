class Inventory < ApplicationRecord
  belongs_to :video
  belongs_to :media_type
  has_many :movie_stocks, dependent: :destroy
  validates :price, presence: true
  validates :total_copies, presence: true
  validates :barcode_no, presence: true
  validates :media_type_id, presence: true
  validates :video_id, presence: true
end
