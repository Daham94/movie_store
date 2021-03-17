class Admin::MediaTypesController < ApplicationController
  before_action :set_media_type, only: %i[ show edit update destroy ]

  def index
    @media_types = MediaType.all
  end

  def show
  end

  def new
    @media_type = MediaType.new
  end

  def create
    @media_type = MediaType.new(media_type_params)
    if @media_type.save
      redirect_to [:admin, @media_type], :notice => "Successfully created media type."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @media_type.update_attributes(media_type_params)
      redirect_to [:admin, @media_type], :notice  => "Successfully updated media type."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @media_type.destroy
    redirect_to admin_media_types_url, :notice => "Successfully destroyed media type."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_media_type
      @media_type = MediaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def media_type_params
      params.require(:media_type).permit(:name)
    end
end
