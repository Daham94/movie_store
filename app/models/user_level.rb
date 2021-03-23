class UserLevel < ActiveRecord::Base
  has_many :users
  validates :level, presence: true
end
