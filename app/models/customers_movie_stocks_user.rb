class CustomersMovieStocksUser < ApplicationRecord
  belongs_to :customer
  belongs_to :movie_stock
  belongs_to :user

end
