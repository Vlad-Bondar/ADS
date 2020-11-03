# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(id:1 ,user_name: 'user1' ,email:'user1@user.mail' ,password:'123456' ,confirmed_at: Time.now)
User.create(id:3 ,user_name: 'user2' ,email:'user2@user.mail' ,password:'123456' ,confirmed_at: Time.now)
User.create(id:2 ,user_name: 'admin',email: 'admin@admin.mail',password:'123456',confirmed_at: Time.now, admin: true,super_admin: true)

Category.create(id: 1 ,title: 'Sport' )
Category.create(id: 2 ,title: 'Car' )
Category.create(id: 3 ,title: 'Nature') 
Category.create(id: 4 ,title: 'Money' )
Category.create(id: 5 ,title: 'Other' )
Category.create(id: 6 ,title: 'Home' )

Post.create(header: 'Sport 1',body: 'Sport 1',category_id: 1 ,user_id: 1,status: Post.statuses[:draft] )
Post.create(header: 'Sport 2',body: 'Sport 2',category_id: 1 ,user_id: 3,status: Post.statuses[:published])
Post.create(header: 'Sport 3',body: 'Sport 3',category_id: 1 ,user_id: 3,status: Post.statuses[:new_post])
Post.create(header: 'Sport 4',body: 'Sport 4',category_id: 1 ,user_id: 3,status: Post.statuses[:rejected])

Post.create(header: 'Car 1',body: 'Car 1',category_id: 2,user_id: 3,status: Post.statuses[:draft])
Post.create(header: 'Car 2',body: 'Car 2',category_id: 2,user_id: 1,status: Post.statuses[:published])
Post.create(header: 'Car 3',body: 'Car 3',category_id: 2,user_id: 1,status: Post.statuses[:approved])
Post.create(header: 'Car 4',body: 'Car 4',category_id: 2,user_id: 1,status: Post.statuses[:rejected])

Post.create(header: 'Nature 1',body: 'Nature 1',category_id: 3,user_id: 1,status: Post.statuses[:approved])
Post.create(header: 'Nature 2',body: 'Nature 2',category_id: 3,user_id: 1,status: Post.statuses[:draft])
Post.create(header: 'Nature 3',body: 'Nature 3',category_id: 3,user_id: 3,status: Post.statuses[:published])
Post.create(header: 'Nature 4',body: 'Nature 4',category_id: 3,user_id: 1,status: Post.statuses[:new_post])

Post.create(header: 'Money 1',body: 'Money 1',category_id: 4,user_id: 3,status: Post.statuses[:approved])
Post.create(header: 'Money 2',body: 'Money 2',category_id: 4,user_id: 3,status: Post.statuses[:new_post])
Post.create(header: 'Money 3',body: 'Money 3',category_id: 4,user_id: 3,status: Post.statuses[:draft])
Post.create(header: 'Money 4',body: 'Money 4',category_id: 4,user_id: 1,status: Post.statuses[:new_post])

Post.create(header: 'Other 1',body: 'Other 1',category_id: 5,user_id: 1,status: Post.statuses[:rejected])
Post.create(header: 'Other 2',body: 'Other 2',category_id: 5,user_id: 3,status: Post.statuses[:new_post])
Post.create(header: 'Other 3',body: 'Other 3',category_id: 5,user_id: 1,status: Post.statuses[:published])
Post.create(header: 'Other 4',body: 'Other 4',category_id: 5,user_id: 3,status: Post.statuses[:archived])
Post.create(header: 'Other 5',body: 'Other 5',category_id: 5,user_id: 1,status: Post.statuses[:new_post])

