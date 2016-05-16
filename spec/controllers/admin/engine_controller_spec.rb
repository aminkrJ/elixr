require 'rails_helper'

RSpec.describe Admin::EngineController, type: :controller do
  before(:each) do
    login_with(create(:admin), :admin)
  end

  describe "GET #dashboard" do
    it "returns http success" do
      get :dashboard
      expect(response).to have_http_status(:success)
    end
  end
end
