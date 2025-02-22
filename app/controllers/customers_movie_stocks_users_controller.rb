class CustomersMovieStocksUsersController < ApplicationController
  before_action :set_customer_movie_stock_user, only: %i[ show edit update destroy ]
  before_action :require_login
  # GET /customers_movie_stocks_users or /customers_movie_stocks_users.json
  def index

    @customers_movie_stocks_users = CustomersMovieStocksUser.where(customer_id: current_user.id)
  end

  # GET /customers_movie_stocks_users/1 or /customers_movie_stocks_users/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Rental No. #{@customer_movie_stock_user.id}",
        page_size: 'A4',
        template: "customers_movie_stocks_users/show.html.erb",
        layout: "pdf.html",
        orientation: "Landscape",
        lowquality: true,
        zoom: 1,
        dpi: 75
      end
    end
  end

  # GET /customers_movie_stocks_users/new
  def new
    @customer_movie_stock_user = CustomersMovieStocksUser.new
    @customer = Customer.new
    @movie_stock = MovieStock.new
    @user = User.new
  end

    # GET /customers_movie_stocks_users/1/edit
  def edit
  end

  # POST /customers_movie_stocks_users or /customers_movie_stocks_userscustomers_movie_stocks_users.json
  def create
    @customer_movie_stock_user = CustomersMovieStocksUser.new(customer_movie_stock_user_params)
    @customer_movie_stock_user.customer_id = current_user.id

    respond_to do |format|
      if @customer_movie_stock_user.save
        format.html { redirect_to  @customer_movie_stock_user, notice: "Rental was successfully created." }
        format.json { render :show, status: :created, location: @customer_movie_stock_user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_movie_stock_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers_movie_stocks_users/1 or /customers_movie_stocks_users/1.json
  def update
    respond_to do |format|
      if @customer_movie_stock_user.update(customer_movie_stock_user_params)
        format.html { redirect_to @customer_movie_stock_user, notice: "Rental was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_movie_stock_user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_movie_stock_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers_movie_stocks_users/1 or /customers_movie_stocks_users/1.json
  def destroy
    @customer_movie_stock_user.destroy
    respond_to do |format|
      format.html { redirect_to customers_movie_stocks_users_url, notice: "Rental was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_movie_stock_user
      @customer_movie_stock_user = CustomersMovieStocksUser.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_movie_stock_user_params
      params.require(:customers_movie_stocks_user).permit(:price, :rented_date, :user_id)
    end

    def require_login
      unless current_user
        redirect_to customer_login_path

      end
    end
end
