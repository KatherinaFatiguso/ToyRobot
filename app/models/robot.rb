class Robot < ActiveRecord::Base

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

  def place(x, y, f)
    self.x = x
    self.y = y
    self.f = f
    self.save!
  end

  def move
    if (self.f == "NORTH") && (self.y < 4)
      self.y += 1
      self.save!
    elsif (self.f == "SOUTH") && (self.y > 0)
      self.y -= 1
      self.save!
    elsif (self.f == "EAST") && (self.x < 4)
      self.x += 1
      self.save!
    elsif (self.f == "WEST") && (self.x > 0)
      self.x -= 1
      self.save!
    end
  end

  def left

  end

  def right

  end

  def report

  end

end
