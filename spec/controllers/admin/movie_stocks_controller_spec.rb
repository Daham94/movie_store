require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::MovieStocksController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => MovieStock.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    MovieStock.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    MovieStock.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_movie_stock_url(assigns[:movie_stock]))
  end

  it "edit action should render edit template" do
    get :edit, :id => MovieStock.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    MovieStock.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MovieStock.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    MovieStock.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MovieStock.first
    response.should redirect_to(admin_movie_stock_url(assigns[:movie_stock]))
  end

  it "destroy action should destroy model and redirect to index action" do
    movie_stock = MovieStock.first
    delete :destroy, :id => movie_stock
    response.should redirect_to(admin_movie_stocks_url)
    MovieStock.exists?(movie_stock.id).should be_false
  end
end
