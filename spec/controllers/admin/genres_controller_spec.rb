require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::GenresController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Genre.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Genre.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Genre.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_genre_url(assigns[:genre]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Genre.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Genre.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Genre.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Genre.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Genre.first
    response.should redirect_to(admin_genre_url(assigns[:genre]))
  end

  it "destroy action should destroy model and redirect to index action" do
    genre = Genre.first
    delete :destroy, :id => genre
    response.should redirect_to(admin_genres_url)
    Genre.exists?(genre.id).should be_false
  end
end
