module TicTacToe
  class Cell
    attr_accessor :value, :marked
    def initialize(value = "")
      @value = value
      @marked = false
    end
  end
end
