require 'bcrypt'

def find_user(user_id)
    run_sql("SELECT * FROM users WHERE id=#{user_id}")
end

def create_user(user_handle, user_email, user_password, user_image_url)
    password_digest = BCrypt::Password.create(user_password)

    run_sql("INSERT INTO users(user_handle, email, password_digest, user_image_url) VALUES($1, $2, $3, $4)", [user_handle, user_email, password_digest, user_image_url])
end
