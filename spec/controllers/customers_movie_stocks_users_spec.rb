require File.dirname(__FILE__) + '/../spec_helper'

describe CustomersMovieStocksUsersController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => CustomersMovieStocksUser.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    CustomersMovieStocksUser.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    CustomersMovieStocksUser.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(customer_movie_stock_user_url(assigns[:customer]))
  end

  it "edit action should render edit template" do
    get :edit, :id => CustomersMovieStocksUser.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    CustomersMovieStocksUser.any_instance.stubs(:valid?).returns(false)
    put :update, :id => CustomersMovieStocksUser.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    CustomersMovieStocksUser.any_instance.stubs(:valid?).returns(true)
    put :update, :id => CustomersMovieStocksUser.first
    response.should redirect_to(customer_movie_stock_user_url(assigns[:customer_movie_stock_user]))
  end

  it "destroy action should destroy model and redirect to index action" do
    customer_movie_stock_user = CustomersMovieStocksUser.first
    delete :destroy, :id => customer_movie_stock_user
    response.should redirect_to(customers_movie_stocks_users_url)
    CustomersMovieStocksUser.exists?(customer_movie_stock_user.id).should be_false
  end
end
