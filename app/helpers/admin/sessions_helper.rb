module Admin::SessionsHelper
  # Logs in the given user.
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end



  def log_in_as_super_user?
    current_user.user_level_id==1
  end

  def log_in_as_admin_user?
    current_user.user_level_id==2
  end

  def log_in_as_normal_user?
    current_user.user_level_id==3
  end

  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

  # Logs out the current user.
  def log_out
    reset_session
    @current_user = nil
  end
end
