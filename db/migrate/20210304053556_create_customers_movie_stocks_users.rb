class CreateCustomersMovieStocksUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers_movie_stocks_users do |t|
      t.float :price
      t.float :late_fee
      t.float :discount
      t.date :rented_date
      t.date :returned_date
      t.references :customer, null: false, foreign_key: true
      t.references :movie_stock, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
