class ActorCountriesController < ApplicationController
  def new
    @actor_country = ActorCountry.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @actor_country = ActorCountry.new(actor_country_params)

      if @actor_country.save
        flash[:success] = "Country Added!"
      else
        render 'new'
      end
  end

  private
  def actor_country_params
    params.require(:actor_country).permit(:country)
  end

end
