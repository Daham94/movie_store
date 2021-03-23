require File.dirname(__FILE__) + '/../spec_helper'

describe VideosController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Video.first
    response.should render_template(:show)
  end

  it "create action should render new template when model is invalid" do
    Review.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Review.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(video_url(assigns[:video]))
  end
end
