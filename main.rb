     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'bcrypt'

enable :sessions

def user_found(users)
  if users.to_a.length > 0
    users[0]
  else
    nil
  end
end

def logged_in?
  !!session[:user_id]
end

def current_user
  if logged_in?
    user_id = session[:user_id]
    users = run_sql("SELECT * FROM users WHERE id=#{user_id}")
    # This runsql will give us a collection of records, specifically data from PG
    user = user_found(users)
    return user
  else
    nil
  end
end

def run_sql(sql)
  db = PG.connect(ENV['DATABASE_URL'] || {dbname: 'appreciation_app_db'})
  results = db.exec(sql)
  db.close
  return results
end

get '/' do
  posts = run_sql("SELECT * FROM posts")
  users = run_sql("SELECT * FROM users").to_a
  binding.pry
  erb :'/wallposts/index', locals: {
    posts: posts,
    users: users
  }
end

post '/wallposts' do
  giver = params["giver"]
  receiver = params["receiver"]
  user_posts = params["user_posts"]
  post_image = params["post_image"]
  run_sql("INSERT INTO posts(giver, receiver, message, timestamp, image_url) VALUES('#{giver}', '#{receiver}', '#{user_posts}', current_timestamp, '#{post_image}')")

  redirect '/'
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

  run_sql("INSERT INTO users(user_handle, email, password_digest, user_image_url) VALUES('#{user_handle}', '#{user_email}', '#{password_digest}', '#{user_image_url}')")

  redirect '/'
end

get '/login' do
  erb :'/sessions/login', locals: {
      error_message: ''
  }
end

post '/sessions' do
  user_email = params['user_email']
  user_password = params['password']

  users = run_sql("SELECT * FROM users WHERE email='#{user_email}'")
  user = user_found(users)

  if user && BCrypt::Password.new(user['password_digest']) == params['password']
    # Log the user in
    session[:user_id] = user['id']

    redirect '/'
  else
    erb :'/sessions/login', locals: {
      error_message: "incorrect login"
  }
  end
end

delete '/sessions' do
  session[:user_id] = nil  

  redirect '/'
end