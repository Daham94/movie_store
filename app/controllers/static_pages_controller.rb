class StaticPagesController < ApplicationController
  def home
    @videos =Video.order("created_at DESC")
  end

  def help
  end

  def about
  end

  def contact
  end
end
