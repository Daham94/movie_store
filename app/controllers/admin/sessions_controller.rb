class Admin::SessionsController < Admin::BaseController
  #include Admin::SessionsHelper

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      reset_session
      log_in user
      redirect_to admin_user_path(user)
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to admin_root_url
  end

end
