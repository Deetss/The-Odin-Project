require 'sinatra'
require 'sinatra/reloader'
require_relative 'lib/caesar-cipher.rb'

get '/' do
    @input = params["message"]
    @count = params['count']
    @cipher = caesar_cipher(@input,@count)
    erb :index, :locals => {:cipher => @cipher}
end