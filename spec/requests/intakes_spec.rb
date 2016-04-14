require 'rails_helper'

RSpec.describe "Intakes", type: :request do
  describe "GET /intakes" do
    it "works! (now write some real specs)" do
      get intakes_path
      expect(response).to have_http_status(200)
    end
  end
end
