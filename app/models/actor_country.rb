class ActorCountry < ActiveRecord::Base
  #attr_accessible :name
  has_many :actors
end
