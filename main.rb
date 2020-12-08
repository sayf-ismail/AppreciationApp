     
require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require 'bcrypt'

enable :sessions


def time_check(post_time)
  time_diff = run_sql("SELECT current_timestamp::timestamp - '#{post_time}'::timestamp;").to_a

  time_parts = time_diff[0]["?column?"].split(":")
  time_interval_string = time_parts[0]+" hours "+time_parts[1]+" mins ago"

  return time_interval_string
end





require_relative 'controllers/users_controller'
require_relative 'controllers/sessions_controller'
require_relative 'controllers/posts_controller'
require_relative 'controllers/comments_controller'

require_relative 'models/users'
require_relative 'models/posts'

require_relative 'helpers/db_helper'
require_relative 'helpers/user_helper'
require_relative 'helpers/comments_helper'
require_relative 'helpers/sessions_helper'