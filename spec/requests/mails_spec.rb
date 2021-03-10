require 'rails_helper'

RSpec.describe "Mails", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/mails/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /send_mail" do
    it "returns http success" do
      get "/mails/send_mail"
      expect(response).to have_http_status(:success)
    end
  end

end
