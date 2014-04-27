user1=User.create(name:"Dima",uid:"ddd@dd.dd", provider:"developer")
user2=User.create(name:"Vova",uid:"vvv@vv.vv", provider:"developer")
user1.tasks.create(description:"Make a coffee", cookie:"2 cookies")
user2.tasks.create(description:"Make a cookies", cookie:"coffee", slave_id:user1.id)