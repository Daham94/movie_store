class Admin::MailsController < Admin::BaseController
  def index
  end



  def send_warning_mail(customer)
    customer = Customer.find(params[:id])
    CustomerMailer.warning(customer).deliver
  end
end
