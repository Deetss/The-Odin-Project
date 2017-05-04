class Game
  attr_reader :codebreaker, :board, :turns
  def initialize
    @codebreaker = Player.new("Code Breaker")
    @board = Board.new
    @turns = 12
  end

  def feedback
    board.check_guess
    puts "There are #{board.feedback[0]} correct, and #{board.feedback[1]} incorrect keys."
  end

  def generate_code
    random_code = []
    4.times do
      random_num = rand(board.code_peg_colors.length)
      random_code << board.code_peg_colors[random_num]
    end
    board.set_code(random_code)
  end

  def guess(colors)
    board.make_guess(colors)
    @turns -= 1
  end

  def game_over_message
    if guess_limit_reached?
      puts "The codemaker has fooled #{codebreaker.name}"
      @turns = 0
    else
      puts "The codebreaker has cracked the code!"
      @turns = 0
    end
  end

  private

  def guess_limit_reached?
    turns == 0 && board.unsolved
  end
end
