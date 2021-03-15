require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::ActorGendersController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => ActorGender.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    ActorGender.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    ActorGender.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_actor_gender_url(assigns[:actor_gender]))
  end

  it "edit action should render edit template" do
    get :edit, :id => ActorGender.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    ActorGender.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ActorGender.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    ActorGender.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ActorGender.first
    response.should redirect_to(admin_actor_gender_url(assigns[:actor_gender]))
  end

  it "destroy action should destroy model and redirect to index action" do
    actor_gender = ActorGender.first
    delete :destroy, :id => actor_gender
    response.should redirect_to(admin_actor_genders_url)
    ActorGender.exists?(actor_gender.id).should be_false
  end
end
