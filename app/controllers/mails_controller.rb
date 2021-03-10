class MailsController < ApplicationController
  def index
  end

  def send_reminder_mail
    customer = Customer.find(params[:id])
    CustomerMailer.reminder(customer).deliver
  end

  def send_warning_mail
    customer = Customer.find(params[:id])
    CustomerMailer.warning(customer).deliver
  end
end
