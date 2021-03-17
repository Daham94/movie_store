class MovieStocksController < ApplicationController
  before_action :set_movie_stock, only: %i[ show ]

  # GET /videos or /videos.json
  def index
    @movie_stocks = MovieStock.all
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_stock
        @movie_stock = MovieStock.find(params[:id])
    end
end
