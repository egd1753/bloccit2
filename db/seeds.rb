# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'random_data'

50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end
posts = Post.all

100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"

Post.find_or_create_by!(
  title: "This is a unique title",
  body: "This is a unique body"
)

Comment.find_or_create_by!(
  post: posts.title."This is a unique title",
  body: "This is a unique comment body"
)

puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
