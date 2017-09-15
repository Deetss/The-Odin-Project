require "sinatra"
require "sinatra/reloader"

@@secret_num = rand(100) + 1
@@correct = false
@@guesses_left = 5
@@color = "white"

def pick_num
    @@secret_num = rand(100) + 1
end
def check_guess(guess)
    if guess - @@secret_num > 5
        @@guesses_left -= 1
        @@color = "red"
        "Way too high!"
    elsif @@secret_num - guess > 5
        @@guesses_left -= 1
        @@color = "red"
        "Way too low!"
    elsif guess > @@secret_num
        @@guesses_left -= 1
        @@color = "yellow"
        "Too high!"
    elsif guess < @@secret_num
        @@guesses_left -= 1
        @@color = "yellow"
        "Too low!"
    elsif guess == @@secret_num
        @@correct = true
        @@guesses_left -= 1
        @@color = "green"
        "You got it right! <br> <br>The secret number is #{@@secret_num}"
    end
end

def new_game
    @@secret_num = rand(100) + 1
    @@color = "white"
    @@guesses_left = 5
end

def out_of_guesses?
    @@guesses_left == 0
end

get "/" do
    guess = params['guess'].to_i
    message = check_guess(guess)
    cheating = params['cheat']
    if cheating
        message = "The secret number is #{@@secret_num}"
    end
    if out_of_guesses?
        pick_num
        new_game
        message = "You've ran out of guesses! A new number has been generated!"
    end

    if @@correct
        pick_num
        new_game
        message = "Good Job! You guessed the correct number! A new number has been generated!"
    end

    erb :index, :locals => {:message => message, :num => @@secret_num, @@color => @@color}

end