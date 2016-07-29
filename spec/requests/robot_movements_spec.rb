require 'rails_helper'

RSpec.describe "RobotMovements", type: :request do
  describe "GET /robot_movements" do
    it "works! (now write some real specs)" do
      get robot_movements_path
      expect(response).to have_http_status(200)
    end
  end
end
