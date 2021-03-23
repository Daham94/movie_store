class MovieStocksController < ApplicationController
  before_action :set_movie_stock, only: %i[ show ]

  # GET /movie_stocks or /movie_stocks.json
  def index
    @movie_stocks = MovieStock.all
  end

  # GET /movie_stocks/1 or /movie_stocks/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_stock
        @movie_stock = MovieStock.find(params[:id])
    end
end
