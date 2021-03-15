class UserLevel < ActiveRecord::Base
  #attr_accessible :level
  has_many :users
end
