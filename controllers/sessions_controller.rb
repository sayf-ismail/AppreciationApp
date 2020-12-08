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