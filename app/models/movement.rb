class Movement < ActiveRecord::Base
  has_many :robot_movements, dependent: :destroy
  has_many :robots, through: :robot_movements
end
