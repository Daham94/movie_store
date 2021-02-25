class UsersController < ApplicationController
  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end

    @actor = Actor.new(actor_params)
    if @actor.save
      flash[:success] = "Actors Saved!"

    else
      render 'new'
    end

  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation, :user_level_id)
    end

    def actor_params
      params.require(:actor).permit(:name, :age, :actor_gender_id, :actor_country_id)
    end
end
