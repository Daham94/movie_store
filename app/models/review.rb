class Review < ApplicationRecord
  belongs_to :customer
  belongs_to :video
  validates :rating, presence: true
  validates :comment, presence: true
end
