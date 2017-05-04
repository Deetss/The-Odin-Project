class Player
  attr_reader :points, :role
  def initialize(role)
    @role = role
    @points = 0
  end
  def add_point
    @points += 1
  end
end
