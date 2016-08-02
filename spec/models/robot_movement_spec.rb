require 'rails_helper'

RSpec.describe RobotMovement, type: :model do
  it { should belong_to(:robot) }
  it { should belong_to(:movement) }
end
