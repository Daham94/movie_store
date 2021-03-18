class Admin::MailsController < Admin::BaseController
  def index
  end



  def send_warning_mail(customer)
    #customer = Customer.find(params[:id])
    @customer = customer
    CustomerMailer.warning(@customer).deliver_now!
  end
end
