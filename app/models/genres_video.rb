class GenresVideo < ApplicationRecord
  belongs_to :genre
  belongs_to :video
end
