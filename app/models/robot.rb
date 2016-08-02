class Robot < ActiveRecord::Base
  has_many :robot_movements, dependent: :destroy
  has_many :movements, through: :robot_movements

  validates :x, :y, :f, presence: true
  validates :x, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 4
    }

  validates :y, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 4
    }

  def report
    "REPORT output: #{self.x}, #{self.y}, #{self.f}"
  end
end
