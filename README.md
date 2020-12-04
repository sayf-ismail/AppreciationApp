# Project 2 - Appreciation App

### Gratitude on the Go!

**Here is the link to use the app: https://sei01-appreciationapp.herokuapp.com/**

**Here are the features of the Appreciation App**

**Technologies used:**
- Ruby
- Sinatra
- Postgresql
- Heroku
- HTML/CSS/Javascript

**While signed out**
- Users can sign in.
- They can view wall posts, but cannot add posts to the wall until signed in.

**When signed in**
- Users can view public wall posts by themselves/other users that convey gratitude to each other. 
- These "posts" take the form of text and images.
- Users can comment on wall posts.

**Challenges faced, and how I tackled them:**
- Timestamps and adapting them to erb/html. The postgresql docs, assistance from instructor and classes helped with translating default timestamps to something more readable (e.g. DateTime.parse(post["timestamp"]).strftime("%Y-%m-%d %H:%M"))
- Posting comments caused fresh wall posts to be created. I implemented an if-statement to differentiate when a user is posting a comment or a wall post.
- Initially all comments would get posted to all posts. I solved this by implementing an erb if-statement that checked a condition that the wall post's ID matched the comments post_ID.

**Other ways I solved for general problems were:**

Getting help from wiser teachers
Googling
W3Schools
Postgresql/Sinatra/Ruby documentation
