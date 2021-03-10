# Preview all emails at http://localhost:3000/rails/mailers/customer_mailer
class CustomerMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/reminder
  def reminder
    CustomerMailer.reminder
  end

  # Preview this email at http://localhost:3000/rails/mailers/customer_mailer/warning
  def warning
    CustomerMailer.warning
  end

end
