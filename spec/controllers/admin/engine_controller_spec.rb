require 'rails_helper'

RSpec.describe EngineController, type: :controller do

  describe "GET #start" do
    it "returns http success" do
      get :start
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #dashboard" do
    it "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #stop" do
    it "returns http success" do
      get :stop
      expect(response).to have_http_status(:success)
    end
  end

end
