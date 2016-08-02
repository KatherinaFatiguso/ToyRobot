require 'rails_helper'

RSpec.describe RobotsController, type: :controller do
  render_views
  let!(:robot) { Robot.new }

  describe '#place' do
    before { get :place, :x => 0, :y => 0, :f => "EAST" }
    it { expect(robot.x).to eq(0) }
    it { expect(robot.y).to eq(0) }
    it { expect(robot.f).to eq("EAST") }
  end
end
