class Admin::CustomersController < Admin::BaseController
  before_action :set_customer, only: %i[ show edit update destroy ]

  # GET /customers or /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1 or /customers/1.json
  def show
  end

  def send_mail
    @customer = CustomerMailer.reminder
  end

  def send_reminder_mail(customer)
    @customer = customer
    CustomerMailer.reminder([:admin, @customer]).deliver_now!
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers or /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to [:admin, @customer], notice: "Customer was successfully created." }
        format.json { render :admin_customer_path, status: :created, location: [:admin, @customer] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1 or /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to [:admin, @customer], notice: "Customer was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @customer] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: [:admin, @customer].errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1 or /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to admin_customers_url, notice: "Customer was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_params
      params.require(:customer).permit(:name, :email, :password)
    end
end
