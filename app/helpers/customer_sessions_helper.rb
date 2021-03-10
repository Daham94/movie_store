module CustomerSessionsHelper
  # Logs in the given user.
  def log_in(customer)
    session[:customer_id] = customer.id
  end

  # Returns the current logged-in user (if any).
  def current_customer
    if customer_session[:customer_id]
      @current_customer ||= Customer.find_by(id: customer_session[:customer_id])
    end
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_customer.nil?
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_customer = nil
  end

  def is_a_user?
    current_customer.is_user == true
  end
end
