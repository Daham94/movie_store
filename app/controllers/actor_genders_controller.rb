class ActorGendersController < ApplicationController
  def new
    @actor_gender = ActorGender.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @actor_gender = ActorGender.new(actor_gender_params)

      if @actor_gender.save
        flash[:success] = "Gender Added!"
      else
        render 'new'
      end
  end

  private
  def actor_gender_params
    params.require(:actor_gender).permit(:name)
  end

end
