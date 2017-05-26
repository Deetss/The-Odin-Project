class Game
  attr_reader :board, :turns, :player
  def initialize
    @player = Player.new
    @board = Board.new
    @turns = 12
  end

  def feedback
    board.check_guess
    puts "There are #{board.feedback[0]} correct, #{board.feedback[1]} out of position, and #{board.feedback[2]} incorrect keys."
  end

  def check_role(role)
    if role == "codemaker"
      puts "Please enter a code for the computer to guess"
      player_code = gets.chomp.split(/\s/)
      player_set_code(player_code)
    else
      computer_generate_code
      puts "The computer generated a code!"
    end
  end

  def player_set_code(colors)
    board.set_code(colors)
  end

  def computer_generate_code
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
## working on AI
  def computer_make_guess
    random_guess = []
    4.times do
      random_num = rand(board.code_peg_colors.length)
      random_guess << board.code_peg_colors[random_num]
    end
    guess(random_guess)
  end

  def game_over_message
    if guess_limit_reached?
      puts "The codemaker has fooled codebreaker"
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
