require 'faker'
# Create Users
5.times do
  user = User.new(
    name:      Faker::Name.name,
    email:     Faker::Internet.email,
    password:  Faker::Lorem.characters(10)
    )
  user.skip_confirmation!
  user.save!
end
user = User.all

#create posts
50.times do
  Post.create!(
    title: Faker::Lorem.sentence,
    body:  Faker::Lorem.paragraph
    )
end
posts = Post.all

#create comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: Faker::Lorem.paragraph
    )
end

User.first.update_attributes!(
  email: 'maguirejustin@hotmail.com',
  password: 'tonearm1',
  )

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
