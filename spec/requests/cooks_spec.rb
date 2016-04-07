require 'rails_helper'

RSpec.describe "Cooks", type: :request do
  describe "GET /cooks" do
    it "works! (now write some real specs)" do
      get cooks_path
      expect(response).to have_http_status(200)
    end
  end
end
