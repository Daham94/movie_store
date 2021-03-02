class ContentRatingsController < ApplicationController
  def new
    @content_rating = ContentRating.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @content_rating = ContentRating.new(content_rating_params)

      if @content_rating.save
        flash[:success] = "Content Rating Added!"
      else
        render 'new'
      end
  end

  private
  def content_rating_params
    params.require(:content_rating).permit(:name)
  end

end
