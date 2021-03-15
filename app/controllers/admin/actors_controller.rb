class Admin::ActorsController < Admin::BaseController
  before_action :set_actor, only: %i[ show edit update destroy ]

  def index
    @actors = Actor.all
  end

  def show
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to [:admin, @actor], :notice => "Successfully created actor."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @actor.update_attributes(actor_params)
      redirect_to [:admin, @actor], :notice  => "Successfully updated actor."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @actor.destroy
    redirect_to admin_actors_url, :notice => "Successfully destroyed actor."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor
      @actor = Actor.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_params
      params.require(:actor).permit(:name, :age, :actor_gender_id, :actor_country_id)
    end
end
