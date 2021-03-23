require File.dirname(__FILE__) + '/../spec_helper'

describe StaticPagesController do
  fixtures :all
  render_views

  it "home action should render home template" do
    get :home
    response.should render_template(:home)
  end

  it "help action should render help template" do
    get :help
    response.should render_template(:help)
  end

  it "about action should render about template" do
    get :about
    response.should render_template(:about)
  end

  it "contact action should render contact template" do
    get :contact
    response.should render_template(:contact)
  end
end
