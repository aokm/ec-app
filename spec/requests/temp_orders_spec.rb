require 'rails_helper'

RSpec.describe "TempOrders", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/temp_orders/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /create" do
    it "returns http success" do
      get "/temp_orders/create"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /replace" do
    it "returns http success" do
      get "/temp_orders/replace"
      expect(response).to have_http_status(:success)
    end
  end

end
