class GenresController < ApplicationController
  def new
    @genre = Genre.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @genre = Genre.new(genre_params)

      if @genre.save
        flash[:success] = "Genre Added!"
      else
        render 'new'
      end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

end
