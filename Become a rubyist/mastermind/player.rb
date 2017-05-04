class Player
  attr_reader :name, :points, :role
  def initialize(name)
    @name = name
    @points = 0
  end
  def add_point
    @points += 1
  end
end
