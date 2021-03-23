class ActorCountry < ActiveRecord::Base
  has_many :actors
  validates :name, presence: true
end
