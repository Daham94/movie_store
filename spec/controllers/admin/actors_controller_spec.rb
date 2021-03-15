require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::ActorsController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => Actor.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    Actor.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    Actor.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_actor_url(assigns[:actor]))
  end

  it "edit action should render edit template" do
    get :edit, :id => Actor.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    Actor.any_instance.stubs(:valid?).returns(false)
    put :update, :id => Actor.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    Actor.any_instance.stubs(:valid?).returns(true)
    put :update, :id => Actor.first
    response.should redirect_to(admin_actor_url(assigns[:actor]))
  end

  it "destroy action should destroy model and redirect to index action" do
    actor = Actor.first
    delete :destroy, :id => actor
    response.should redirect_to(admin_actors_url)
    Actor.exists?(actor.id).should be_false
  end
end
