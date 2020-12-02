     
require 'sinatra'
require 'sinatra/reloader'
require 'pg'
require 'pry'
require 'bcrypt'

get '/' do
  erb :'/wallposts/index'
end





