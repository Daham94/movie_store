module ReviewsHelper
  def current_customer
    if session[:customer_id]
      @current_customer ||= Customer.find_by(id: session[:customer_id])
    end
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end
end
