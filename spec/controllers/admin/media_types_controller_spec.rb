require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::MediaTypesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => MediaType.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    MediaType.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    MediaType.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_media_type_url(assigns[:media_type]))
  end

  it "edit action should render edit template" do
    get :edit, :id => MediaType.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    MediaType.any_instance.stubs(:valid?).returns(false)
    put :update, :id => MediaType.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    MediaType.any_instance.stubs(:valid?).returns(true)
    put :update, :id => MediaType.first
    response.should redirect_to(admin_media_type_url(assigns[:media_type]))
  end

  it "destroy action should destroy model and redirect to index action" do
    media_type = MediaType.first
    delete :destroy, :id => media_type
    response.should redirect_to(admin_media_types_url)
    MediaType.exists?(media_type.id).should be_false
  end
end
