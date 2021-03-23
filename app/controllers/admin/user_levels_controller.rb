class Admin::UserLevelsController < Admin::BaseController
  before_action :set_user_level, only: %i[ show edit update destroy ]

  def index
    @user_levels = UserLevel.all
  end

  def show
  end

  def new
    @user_level = UserLevel.new
  end

  def create
    @user_level = UserLevel.new(user_level_params)
    if @user_level.save
      redirect_to [:admin, @user_level], :notice => "Successfully created user level."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @user_level.update_attributes(user_level_params)
      redirect_to [:admin, @user_level], :notice  => "Successfully updated user level."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @user_level.destroy
    redirect_to admin_user_levels_url, :notice => "Successfully destroyed user level."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_level
      @user_level = UserLevel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_level_params
      params.require(:user_level).permit(:level)
    end
end
