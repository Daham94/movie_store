require File.dirname(__FILE__) + '/../spec_helper'

describe MovieStocksController do
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
end
