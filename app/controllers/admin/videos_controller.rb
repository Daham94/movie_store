class Admin::VideosController < Admin::BaseController
  before_action :set_video, only: %i[ show edit update destroy ]

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

  # GET /videos/new
  def new
    @video = Video.new
    @content_rating = ContentRating.new
    @genre = Genre.new
    @actor = Actor.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)

    @review = Review.where(video_id: @video.id)

    if @review.blank?
      @video.rating = 0
    else
      @video.rating = @review.average(:rating).round(2)
    end


    respond_to do |format|
      if @video.save

        format.html { redirect_to [:admin, @video], notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: [:admin, @video] }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: [:admin, @video].errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to [:admin, @video], notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: [:admin, @video] }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: [:admin, @video].errors, status: :unprocessable_entity }
      end
    end
  end

    # DELETE /videos/1 or /videos/1.json
  def destroy

    respond_to do |format|
      if @video.destroy
        format.html { redirect_to admin_videos_url, notice: "Video was successfully destroyed." }
        format.json { head :no_content }
      end

    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description, :release_date, :content_rating_id, :thumbnail, :actor_ids=>[], :genre_ids=>[])
    end

end
