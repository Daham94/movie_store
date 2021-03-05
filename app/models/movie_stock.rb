class MovieStock < ApplicationRecord
  belongs_to :inventory
  has_many :customers_movie_stocks_users
  has_many :customers, :through => :customers_movie_stocks_users
  has_many :users, :through => :customers_movie_stocks_users
end
