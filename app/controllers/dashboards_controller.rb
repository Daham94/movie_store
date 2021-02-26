class DashboardsController < ApplicationController
  def register
  end

  def video

  end

  def rental
  end

  def customer
  end

  private
    def video_params
      params.require(:video).permit(:title, :description, :thumbnail,
                                    :release_date, :rating, :content_rating_id)
    end

    def actor_params
      params.require(:actor).permit(:name, :age, :actor_gender_id, :actor_country_id)
    end
end
