def current_user
    if logged_in?
      user_id = session[:user_id]
      users = find_user(user_id)
      # This runsql will give us a collection of records, specifically data from PG
      user = user_found(users)
      return user
    else
      nil
    end
end

def user_found(users)
    if users.to_a.length > 0
      users[0]
    else
      nil
    end
end