class VideosController < ApplicationController
  before_action :set_video, only: %i[ show ]

  # GET /videos or /videos.json
  def index
    @videos =Video.order("created_at DESC")
    if params[:search]
      @search_term = params[:search]
      @videos = @videos.search_by(@search_term)
    end
  end

  # GET /videos/1 or /videos/1.json
  def show
    @review = Review.where(video_id: @video.id).order("created_at DESC")

    if @review.blank?
      @avg_review = 0
    else
      @avg_review = @review.average(:rating).round(2)
    end
  end

  def create

    @review = Review.where(video_id: @video.id)

    if @review.blank?
      @video.rating = 1
    else
      @video.rating = @review.average(:rating).round(2)
    end


    respond_to do |format|
      if @review.save

        format.html { redirect_to @video, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

end
