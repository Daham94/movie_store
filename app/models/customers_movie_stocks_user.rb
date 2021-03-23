class CustomersMovieStocksUser < ApplicationRecord
  belongs_to :customer
  belongs_to :movie_stock
  belongs_to :user
  validates :price, presence: true
  validates :rented_date, presence: true
  validates :movie_stock_id, presence: true
  validates :customer_id, presence: true
  validates :user_id, presence: true
end
