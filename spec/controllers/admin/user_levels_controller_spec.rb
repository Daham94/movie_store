require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::UserLevelsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => UserLevel.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    UserLevel.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    UserLevel.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_user_level_url(assigns[:user_level]))
  end

  it "edit action should render edit template" do
    get :edit, :id => UserLevel.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    UserLevel.any_instance.stubs(:valid?).returns(false)
    put :update, :id => UserLevel.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    UserLevel.any_instance.stubs(:valid?).returns(true)
    put :update, :id => UserLevel.first
    response.should redirect_to(admin_user_level_url(assigns[:user_level]))
  end

  it "destroy action should destroy model and redirect to index action" do
    user_level = UserLevel.first
    delete :destroy, :id => user_level
    response.should redirect_to(admin_user_levels_url)
    UserLevel.exists?(user_level.id).should be_false
  end
end
