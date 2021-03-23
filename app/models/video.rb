class Video < ApplicationRecord
  searchkick
  has_many :actors_videos
  has_many :actors, through: :actors_videos
  belongs_to :content_rating
  has_many :inventories, dependent: :destroy
  has_many :media_type, :through => :inventories
  has_many :genres_videos, dependent: :destroy
  has_many :genres, :through => :genres_videos
  has_many :customers, :through => :reviews
  has_many :reviews, dependent: :destroy
  has_attached_file :thumbnail, styles: {medium: "200*300"}
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
  validates :title, presence: true
  validates :description, presence: true
  validates :thumbnail, presence: true
  validates :release_date, presence: true
  validates :content_rating_id, presence: true

  def self.search_by(search_term)
    where("LOWER(title) LIKE :search_term", search_term: "%#{search_term.downcase}%").uniq
  end
end
