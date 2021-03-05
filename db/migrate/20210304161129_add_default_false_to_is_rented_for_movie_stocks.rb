class AddDefaultFalseToIsRentedForMovieStocks < ActiveRecord::Migration[6.0]
  def change
    change_column_default :movie_stocks, :is_rented, from: nil, to: false
  end
end
