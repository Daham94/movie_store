class VideosController < ApplicationController
  before_action :set_video, only: %i[ show ]

  def search
    if params[:search].present?
      @videos = Video.search(params[:search])
    else
      @videos = Video.all
    end
  end

  # GET /videos or /videos.json
  def index
    @videos =Video.all
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


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

end
