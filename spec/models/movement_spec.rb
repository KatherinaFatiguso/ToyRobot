require 'rails_helper'

RSpec.describe Movement, type: :model do
  it { is_expected.to have_many(:robot_movements) }
  it { is_expected.to have_many(:robots).through(:robot_movements) }
end
