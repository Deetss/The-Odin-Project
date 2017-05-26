class Board
  attr_reader :code_peg_colors, :key_peg_colors, :feedback
  def initialize
    @code_positions = { 0 => "_", 1 => "_", 2 => "_", 3 => "_"}
    @guess_positions = { 0 => "_", 1 => "_", 2 => "_", 3 => "_"}
    @code_peg_colors = ["red", "orange", "yellow", "green", "blue", "purple"]
    @key_peg_colors = ["green", "red"]
    @feedback = [0,0,0]
  end
  #place a peg on the board to guess with
  def make_guess(colors)
    colors.each_with_index do |color, index|
      @guess_positions[index] = color
    end
  end

  def check_guess
    @feedback = [0,0,0]
    @guess_positions.each do |index, color|
      if @code_positions[index] == color
        @feedback[0] += 1
      elsif @code_positions.has_value?(color)
        @feedback[1] += 1
      else
        @feedback[2] += 1
      end
    end

    if @feedback[2] == 4
      solved_code?
    end
  end

  def show_last_guess
    @guess_positions.each { |index,color| print "#{color} "}
    print "\n"
  end

  #set color to each position
  def set_code(colors)
    colors.each_with_index do |color, index|
      @code_positions[index] = color
    end
  end

  def solved_code?
    correct?
  end

  def unsolved
    !solved_code?
  end

  private
  def correct?
    @code_positions == @guess_positions
  end

end
