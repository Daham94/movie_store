require File.dirname(__FILE__) + '/../spec_helper'

describe Admin::ActorCountriesController do
  fixtures :all
  render_views

  it "index action should render index template" do
    get :index
    response.should render_template(:index)
  end

  it "show action should render show template" do
    get :show, :id => ActorCountry.first
    response.should render_template(:show)
  end

  it "new action should render new template" do
    get :new
    response.should render_template(:new)
  end

  it "create action should render new template when model is invalid" do
    ActorCountry.any_instance.stubs(:valid?).returns(false)
    post :create
    response.should render_template(:new)
  end

  it "create action should redirect when model is valid" do
    ActorCountry.any_instance.stubs(:valid?).returns(true)
    post :create
    response.should redirect_to(admin_actor_country_url(assigns[:actor_country]))
  end

  it "edit action should render edit template" do
    get :edit, :id => ActorCountry.first
    response.should render_template(:edit)
  end

  it "update action should render edit template when model is invalid" do
    ActorCountry.any_instance.stubs(:valid?).returns(false)
    put :update, :id => ActorCountry.first
    response.should render_template(:edit)
  end

  it "update action should redirect when model is valid" do
    ActorCountry.any_instance.stubs(:valid?).returns(true)
    put :update, :id => ActorCountry.first
    response.should redirect_to(admin_actor_country_url(assigns[:actor_country]))
  end

  it "destroy action should destroy model and redirect to index action" do
    actor_country = ActorCountry.first
    delete :destroy, :id => actor_country
    response.should redirect_to(admin_actor_countries_url)
    ActorCountry.exists?(actor_country.id).should be_false
  end
end
