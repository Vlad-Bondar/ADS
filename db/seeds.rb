# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.create(header: 'Sport',body: 'Sport',category_id: 1 ,user_id: 1)
Post.create(header: 'Car',body: 'Car',category_id: 2,user_id: 1)
Post.create(header: 'Nature',body: 'Nature',category_id: 3,user_id: 1)
Post.create(header: 'Money',body: 'Money',category_id: 4,user_id: 2)


User.create(id:1 ,user_name: 'user1' ,email:'user1@user.mail' ,password:'123456' ,confirmed_at: Time.now)
User.create(id:1 ,user_name: 'user2' ,email:'user2@user.mail' ,password:'123456' ,confirmed_at: Time.now)
User.create(id:2 ,user_name: 'admin',email: 'admin@admin.mail',password:'123456',confirmed_at: Time.now, admin: true,super_admin: true)

Category.create(id: 1 title: 'Sport' )
Category.create(id: 2 title: 'Car' )
Category.create(id: 3 title: 'Nature') 
Category.create(id: 4 title: 'Money' )
Category.create(id: 5 title: 'Other' )