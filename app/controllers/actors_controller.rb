class ActorsController < ApplicationController
  def new
    @actor = Actor.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @actor = Actor.new(actor_params)

      if @actor.save
        flash[:success] = "Actor Added!"
      else
        render 'new'
      end
  end

  private
  def actor_params
    params.require(:actor).permit(:name, :age, :actor_gender_id, :actor_country_id)
  end

end
