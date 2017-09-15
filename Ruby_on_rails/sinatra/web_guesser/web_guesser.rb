require "sinatra"
require "sinatra/reloader"

def pick_num
    num = rand(100) + 1
    num
end

num = pick_num

get "/" do
    erb :index, :locals => {:num => num}
end