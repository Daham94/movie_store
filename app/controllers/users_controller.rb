class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /videos.json
  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
    @user_level = UserLevel.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @user = User.new(user_params)
      if @user.save
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
  end

  # PATCH/PUT /users/1 or /videos/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /videos/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                    :password_confirmation, :user_level_id)
    end
end
