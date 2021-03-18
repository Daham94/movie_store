class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.reminder.subject
  #

  def reminder(customer)
    @customer = customer
    @greeting = "Hi"

    mail(to: @customer.email, subject: "Reminder for the return")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.warning.subject
  #
  def warning(customer)
    @customer = customer
    @greeting = "Hi"

    mail(to: @customer.email, subject: "Warning for the return")
  end

  def wait_list(customer)
    @customer = customer
    @greeting = "Hi"

    mail(to: @customer.email, subject: "Your order is Available")
  end
end
