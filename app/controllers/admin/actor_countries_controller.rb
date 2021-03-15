class Admin::ActorCountriesController < Admin::BaseController
  before_action :set_actor_country, only: %i[ show edit update destroy ]

  def index
    @actor_countries = ActorCountry.all
  end

  def show
  end

  def new
    @actor_country = ActorCountry.new
  end

  def create
    @actor_country = ActorCountry.new(actor_country_params)
    if @actor_country.save
      redirect_to [:admin, @actor_country], :notice => "Successfully created actor country."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @actor_country.update_attributes(actor_country_params)
      redirect_to [:admin, @actor_country], :notice  => "Successfully updated actor country."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @actor_country.destroy
    redirect_to admin_actor_countries_url, :notice => "Successfully destroyed actor country."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_actor_country
      @actor_country = ActorCountry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def actor_country_params
      params.require(:actor_country).permit(:name)
    end
end
