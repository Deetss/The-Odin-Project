require "sinatra"
require "sinatra/reloader"

SECRET_NUM = rand(100) + 1

def check_guess(guess)
    if guess - SECRET_NUM > 5
        "Way too high!"
    elsif SECRET_NUM - guess > 5
        "Way too low!"
    elsif guess > SECRET_NUM
        "Too high!"
    elsif guess < SECRET_NUM
        "Too low!"
    elsif guess == SECRET_NUM
        "You got it right! <br> <br>The secret number is #{SECRET_NUM}"
    end
end

get "/" do
    guess = params['guess'].to_i
    message = check_guess(guess)
    erb :index, :locals => {:message => message, :num => SECRET_NUM}

end