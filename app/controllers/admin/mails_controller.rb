class Admin::MailsController < Admin::BaseController
  def index
  end

  def send_reminder_mail
    customer = Customer.find(params[:id])
    CustomerMailer.reminder(customer).deliver
    flash[:notice] = "Email has been sent."
    redirect_to admin_customer_path(customer)
  end

  def send_warning_mail
    customer = Customer.find(params[:id])
    CustomerMailer.warning(customer).deliver_now!
    flash[:notice] = "Email has been sent."
    redirect_to admin_customer_path(customer)
  end

  def send_wait_list_mail
    customer = Customer.find(params[:id])
    CustomerMailer.wait_list(customer).deliver_now!
    flash[:notice] = "Email has been sent."
    redirect_to admin_customer_path(customer)
  end
end
