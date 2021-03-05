require 'rails_helper'

RSpec.describe "MovieStocks", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/movie_stocks/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /new" do
    it "returns http success" do
      get "/movie_stocks/new"
      expect(response).to have_http_status(:success)
    end
  end

end
