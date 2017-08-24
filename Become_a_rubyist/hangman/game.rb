require_relative "word.rb"

class Game
  attr_accessor :current_guess
  attr_reader :turns, :guesses, :secret_word, :hidden_word
  def initialize
    @turns = 12
    @word = Word.new
    @secret_word = @word.random_word
    @hidden_word = @word.blank_word
    @guesses = []
    @current_guess = ""
  end

  def make_guess
    puts "Make a guess:"
    @current_guess = gets.chomp
    puts
    guesses << current_guess
  end

  def show_letter
    split_blanks = hidden_word.split("")
    occurences = []
    occurences = (0 ... secret_word.length).find_all { |i| secret_word[i,1] == current_guess}
    occurences.each { |i| split_blanks[i] = current_guess}
    @hidden_word = split_blanks.join("")
    puts hidden_word
  end

  def check_guess
    show_letter
    if secret_word.include? current_guess
      puts "This word includes the guessed letter\n\n" 
    else
      puts "This word does not include the guessed letter\n\n"
    end
  end

  def show_guesses
    puts "Guesses: #{guesses.join(" ")}\n"
  end

  def end_turn
    @turns -= 1
    if turns == 0
      puts "Game over! \n\nThe word was #{secret_word}"
    else
      puts "Turns left: #{turns} \n\n"
    end
  end
  
  def have_blanks?
    hidden_word.match("_")
  end

  def game_over?
    if current_guess == secret_word || !have_blanks?
      puts "Congratulations! You have successfully solved the puzzle!\n"
      @turns = 1      
    end
  end

end

game = Game.new
word = game.secret_word

while game.turns > 0
  game.make_guess
  game.check_guess
  game.show_guesses
  game.game_over?
  game.end_turn
end
