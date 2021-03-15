class Admin::ContentRatingsController < Admin::BaseController
  before_action :set_content_rating, only: %i[ show edit update destroy ]

  def index
    @content_ratings = ContentRating.all
  end

  def show
  end

  def new
    @content_rating = ContentRating.new
  end

  def create
    @content_rating = ContentRating.new(content_rating_params)
    if @content_rating.save
      redirect_to [:admin, @content_rating], :notice => "Successfully created content rating."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @content_rating.update_attributes(content_rating_params)
      redirect_to [:admin, @content_rating], :notice  => "Successfully updated content rating."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @content_rating.destroy
    redirect_to admin_content_ratings_url, :notice => "Successfully destroyed content rating."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content_rating
      @content_rating = ContentRating.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_rating_params
      params.require(:content_rating).permit(:name)
    end
end
