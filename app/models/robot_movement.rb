class RobotMovement < ActiveRecord::Base
  belongs_to :robot
  belongs_to :movement
end
