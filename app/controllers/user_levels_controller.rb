class UserLevelsController < ApplicationController
  def new
    @user_level = UserLevel.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user_level = UserLevel.new(user_level_params)

      if @user_level.save
        flash[:success] = "User Level Added!"
        
      else
        render 'new'
      end
  end

  private
  def user_level_params
    params.require(:user_level).permit(:level)
  end

end
