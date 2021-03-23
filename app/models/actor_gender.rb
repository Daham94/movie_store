class ActorGender < ActiveRecord::Base
  has_many :actors
  validates :gender, presence: true
end
