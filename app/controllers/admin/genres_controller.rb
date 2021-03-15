class Admin::GenresController < Admin::BaseController
  before_action :set_genre, only: %i[ show edit update destroy ]

  def index
    @genres = Genre.all
  end

  def show
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to [:admin, @genre], :notice => "Successfully created genre."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @genre.update_attributes(genre_params)
      redirect_to [:admin, @genre], :notice  => "Successfully updated genre."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @genre.destroy
    redirect_to admin_genres_url, :notice => "Successfully destroyed genre."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_genre
      @genre = Genre.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def genre_params
      params.require(:genre).permit(:name)
    end
end
