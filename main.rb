     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'bcrypt'

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'appreciation_app_db'})
  result = db.exec(sql)
  db.close
  return result
end

get '/' do
  run_sql("SELECT * FROM posts;")
  erb :'/wallposts/index'
end




