def comments_check(post_id)
    comment_message_userid = run_sql("SELECT user_id, message FROM comments WHERE post_id=$1", [post_id]).to_a
end