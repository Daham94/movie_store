class CreateMovieStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :movie_stocks do |t|
      t.boolean :is_rented

      t.timestamps
    end
  end
end
