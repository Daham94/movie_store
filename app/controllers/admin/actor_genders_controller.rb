class Admin::ActorGendersController < Admin::BaseController
  before_action :set_actor_gender, only: %i[ show edit update destroy ]

  def index
    @actor_genders = ActorGender.all
  end

  def show
  end

  def new
    @actor_gender = ActorGender.new
  end

  def create
    @actor_gender = ActorGender.new(actor_gender_params)
    if @actor_gender.save
      redirect_to [:admin, @actor_gender], :notice => "Successfully created actor gender."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @actor_gender.update_attributes(actor_gender_params)
      redirect_to [:admin, @actor_gender], :notice  => "Successfully updated actor gender."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @actor_gender.destroy
    redirect_to admin_actor_genders_url, :notice => "Successfully destroyed actor gender."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_gender
      @actor_gender = ActorGender.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_gender_params
      params.require(:actor_gender).permit(:gender)
    end
end
