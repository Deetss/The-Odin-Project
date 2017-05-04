require_relative "board.rb"
require_relative "player.rb"
require_relative "game.rb"

puts "Welcome to the game of mastermind!"
puts "Enter the number of games you wish to play:"
num_of_games = gets.chomp.to_i
while num_of_games > 0
  game = Game.new
  puts "Please choose a role(codebreaker or codemaker):"
  role = gets.chomp.downcase
  game.check_role(role)
  board = game.board
  while game.turns > 0
    if game.player.role == "codebreaker"
      puts "Please make your guess:"
      guess_order = gets.chomp.split(/\s/)
      game.guess(guess_order)
    else
      #create AI for computer
    end
    print "\n"
    board.show_last_guess
    if board.solved_code?
      game.game_over_message
      num_of_games -= 1
    elsif game.turns == 0
      game.game_over_message
      num_of_games -= 1
    else
      game.feedback
    end
  end

end
