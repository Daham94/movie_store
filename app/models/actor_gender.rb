class ActorGender < ActiveRecord::Base
  #attr_accessible :gender
  has_many :actors
end
