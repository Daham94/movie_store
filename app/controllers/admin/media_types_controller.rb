class Admin::MediaTypesController < Admin::BaseController
  def new
    @media_type = MediaType.new
  end

  # GET /users/1/edit
  def edit
  end

  def create
    @media_type = MediaType.new(media_type_params)

      if @media_type.save
        flash[:success] = "Media Type Added!"

      else
        render 'new'
      end
  end

  private
  def media_type_params
    params.require(:media_type).permit(:name)
  end
end
