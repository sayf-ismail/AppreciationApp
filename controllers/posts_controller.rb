get '/' do
    posts = run_sql("SELECT * FROM posts")
    users = run_sql("SELECT * FROM users").to_a
    comments = run_sql("SELECT * FROM comments")
  
    erb :'/wallposts/index', locals: {
      posts: posts,
      users: users,
      comments: comments
    }
end

post '/wallposts' do
    giver = params["giver"]
    receiver = params["receiver"]
    user_posts = params["user_posts"]
    post_image = params["post_image"]
    post_user_id = params["user_id"]
    commenter = params["commenter"]
    comment_message = params["comment_input"]
    comment_post_id = params["post_id"]
  
    if comment_post_id == nil
      run_sql("INSERT INTO posts(giver, receiver, message, timestamp, image_url, user_id) VALUES($1, $2, $3, current_timestamp, $4, $5)", [giver, receiver, user_posts, post_image, post_user_id])
    else
      run_sql("INSERT INTO comments(message, post_id, user_id) VALUES($1, $2, $3)", [comment_message, comment_post_id.to_i, commenter.to_i])
    end
  
    redirect '/'
end