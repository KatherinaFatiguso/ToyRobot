require 'rails_helper'
# require 'simplecov'
# SimpleCov.start 'rails'

RSpec.describe Robot, type: :model do
  it { is_expected.to validate_presence_of(:x) }
  it { is_expected.to validate_presence_of(:y) }
  it { is_expected.to validate_presence_of(:f) }
  it { is_expected.to have_many(:robot_movements) }
  it { is_expected.to have_many(:movements).through(:robot_movements) }
  it { should validate_numericality_of(:x) }
  it { should_not allow_value(-1).for(:x) }
  it { should allow_value(0).for(:x) }
  it { should_not allow_value(5).for(:x) }
  it { should allow_value(4).for(:x) }
  it { should validate_numericality_of(:y) }
  it { should_not allow_value(-1).for(:y) }
  it { should allow_value(0).for(:y) }
  it { should_not allow_value(5).for(:y) }
  it { should allow_value(4).for(:y) }

  describe '#report' do
    let(:robot) { Robot.new(x: 0, y:0, f: 'EAST')}
    specify 'that report is correct' do
      expect(robot.report).to eq('REPORT output: 0, 0, EAST')
    end
  end
end
