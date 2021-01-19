require 'rails_helper'

RSpec.describe "Comments", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/comments/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/comments/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/comments/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /destroy" do
    it "returns http success" do
      get "/comments/destroy"
      expect(response).to have_http_status(:success)
    end
  end

end
