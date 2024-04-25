# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Post.delete_all
User.delete_all
Tag.destroy_all

# Create users
users = []
5.times do |i|
  user = User.create!(
    name: "User#{i + 1}",
    email: "user#{i + 1}@example.com",
    password: "password"
  )
  users << user
end

# Create tags
tags = []
5.times do |i|
  tag = Tag.create!(
    name: "Tag#{i + 1}"
  )
  tags << tag
end

# Create posts with tags and associate them with users
posts = []
10.times do |i|
  user = users.sample
  post = user.posts.create!(
  title: "Post #{i + 1}",
  content: "Content of post #{i + 1}",
  published_at: nil, # Corrected this line
  answers_count: rand(10),
  likes_count: rand(100)
)

  # Ensure each post has at least one tag
  post.tags << tags.sample

  posts << post
end

# Associate additional tags with posts
posts.each do |post|
  # Ensure each post has at least one tag
  remaining_tags = tags - post.tags
  additional_tags = remaining_tags.sample(rand(4) + 1)
  post.tags << additional_tags
end

