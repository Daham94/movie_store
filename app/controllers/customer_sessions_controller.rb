class CustomerSessionsController < ApplicationController
  def new
  end

  def create
    customer = Customer.find_by(email: params[:session][:email].downcase)

    if customer && customer.authenticate(params[:session][:password])
      reset_session
      log_in customer
      redirect_to customer_path(customer)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
