class Movement < ActiveRecord::Base
  has_many :robot_movements
  has_many :robots, through: :robot_movements
end
