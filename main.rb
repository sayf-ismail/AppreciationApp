     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'bcrypt'

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'appreciation_app_db'})
  results = db.exec(sql)
  db.close
  return results
end

get '/' do
  posts = run_sql("SELECT * FROM posts")
  users = run_sql("SELECT * FROM users")
  erb :'/wallposts/index', locals: {
    posts: posts,
    users: users
  }
end

get '/users/signup' do
  erb :'/users/signup'
end

post '/users' do
  user_handle = params['user_handle']
  user_email = params['user_email']
  user_password = params['password']
  user_image_url = params['user_image_url']

  password_digest = BCrypt::Password.create(user_password)

  run_sql("INSERT INTO users(user_handle, email, user_password, user_image_url) VALUES('#{user_handle}', '#{user_email}', '#{user_password}', '#{user_image_url}')")

  redirect '/'
end

