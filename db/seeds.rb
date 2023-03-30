# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
second_user = User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.')

first_post = Post.create(author: first_user, title: 'Bonjour', text: 'Greeting in french')
second_post = Post.create(author: first_user, title: 'Guess Game', text: 'Dont guess all the time, but do so when you are sure')
third_post = Post.create(author: first_user, title: 'Food is sweet', text: 'Bread is universally eaten')
fourth_post = Post.create(author: first_user, title: 'Holla', text: 'Spanish greeting')
fifth_post = Post.create(author: second_user, title: 'Merci', text: 'Thank you microverse')

comment1 = Comment.create(post: Post.first,author: User.first, text: 'Hi Lilly!' )
comment2 = Comment.create(post: Post.first,author: User.second, text: 'Hi Tom!' )
comment3 = Comment.create(post: Post.second,author: User.second, text: 'Hi!' )
comment4 = Comment.create(post: Post.second,author: User.first, text: 'Hey!' )
comment5 = Comment.create(post: Post.third,author: User.first, text: 'Hi there!' )
comment6 = Comment.create(post: Post.third,author: User.second, text: 'Hello!' )

like1 = Like.create(post: Post.first,author: User.first)

user = User.find_by(name: 'Lilly')
posts_lilly = Post.find_by(author: first_user)
user_update = User.find_by(name: 'Tom').update(bio: 'Developer World')
user3 = User.create(name: 'Annie', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Hurray.')
user3.destroy
