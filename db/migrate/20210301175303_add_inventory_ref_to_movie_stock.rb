class AddInventoryRefToMovieStock < ActiveRecord::Migration[6.0]
  def change
    add_reference :movie_stocks, :inventory, null: false, foreign_key: true
  end
end
