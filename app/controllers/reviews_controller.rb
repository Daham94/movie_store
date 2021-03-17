class ReviewsController < ApplicationController
    before_action :set_review, only: [ :show, :edit, :update, :destroy ]
    before_action :set_video

    # GET /reviews or /reviews.json
    def index
      @reviews = Review.all
    end

    # GET /reviews/1 or /reviews/1.json
    def show
    end

    # GET /reviews/new
    def new
      @review = Review.new
    end

    # GET /reviews/1/edit
    def edit
    end

    # POST /reviews or /reviews.json
    def create
      @review = Review.new(review_params)
      @review.customer_id = current_user.id
      @review.video_id = @video.id

      respond_to do |format|
        if @review.save
          format.html { redirect_to @video, notice: "Review was successfully created." }
          format.json { render :show, status: :created, location: @review }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    # PATCH/PUT /reviews/1 or /reviews/1.json
    def update
      respond_to do |format|
        if @review.update(review_params)
          format.html { redirect_to @review, notice: "Review was successfully updated." }
          format.json { render :show, status: :ok, location: @review }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @review.errors, status: :unprocessable_entity }
        end
      end
    end

    # DELETE /reviews/1 or /reviews/1.json
    def destroy
      @review.destroy
      respond_to do |format|
        format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_review
        @review = Review.find(params[:id])
      end

      def set_video
        @video = Video.find(params[:video_id])
      end

      # Only allow a list of trusted parameters through.
      def review_params
        #params[:review].merge!(:customer_id => current_customer.id.to_s)
        params.require(:review).permit(:rating, :comment)
      end
end
