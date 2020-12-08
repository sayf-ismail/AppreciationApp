get '/users/signup' do
    erb :'/users/signup'
end
  
post '/users' do
    user_handle = params['user_handle']
    user_email = params['user_email']
    user_password = params['password']
    user_image_url = params['user_image_url']

    create_user(user_handle, user_email, user_password, user_image_url)

    redirect '/'
end