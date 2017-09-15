require "sinatra"
require "sinatra/reloader"

SECRET_NUM = rand(100) + 1
$color = "white"

def check_guess(guess)
    if guess - SECRET_NUM > 5
        $color = "red"
        "Way too high!"
    elsif SECRET_NUM - guess > 5
        $color = "red"
        "Way too low!"
    elsif guess > SECRET_NUM
        $color = "#fcf235"
        "Too high!"
    elsif guess < SECRET_NUM
        $color = "#fcf235"
        "Too low!"
    elsif guess == SECRET_NUM
        $color = "green"
        "You got it right! <br> <br>The secret number is #{SECRET_NUM}"
    end
end

get "/" do
    guess = params['guess'].to_i
    message = check_guess(guess)
    erb :index, :locals => {:message => message, :num => SECRET_NUM, :color => $color}

end