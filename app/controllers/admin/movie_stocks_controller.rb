class Admin::MovieStocksController < Admin::BaseController
  before_action :set_movie_stock, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    @movie_stocks = MovieStock.all
  end

  # GET /videos/1 or /videos/1.json
  def show
  end

  # GET /videos/new
  def new
    @movie_stock = MovieStock.new
    @inventory = Inventory.all
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @movie_stock = MovieStock.new(movie_stock_params)

    respond_to do |format|
      if @movie_stock.save

        format.html { redirect_to [:admin, @movie_stock], notice: "Movie Stock was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @movie_stock] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: [:admin, @movie_stock].errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @movie_stock.update(movie_stock_params)
        format.html { redirect_to [:admin, @movie_stock], notice: "Movie Stock was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @movie_stock] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: [:admin, @movie_stock].errors, status: :unprocessable_entity }
      end

    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @movie_stock.destroy
    respond_to do |format|
      format.html { redirect_to admin_movie_stocks_url, notice: "Movie Stock was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_stock
        @movie_stock = MovieStock.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_stock_params
      params.require(:movie_stock).permit(:is_rented, :inventory_id)
    end
end
