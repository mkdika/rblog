user = User.create!(email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', display_name: 'Administrator')
categories = Category.create [{name: 'Ruby'},{name: 'Java'},{name: 'Kotlin'},
                              {name: 'Agile'},{name: 'Javascript'},{name: 'DevOps'},
                              {name: 'Golang'},{name: 'Rust'},{name: 'CloudPlatform'}]

tags = Tag.create [{name: 'tutorial'},{name: 'poc'},{name: 'back-end'}, {name: 'event'}, {name: 'front-end'}]

# Create sample post
posts = []
(1..20).each do |i|
  post = Post.new.tap do |p|
    p.title = Faker::Book.unique.title
    p.content = Faker::Books::Dune.quote
    p.category = categories.sample
    p.user = user
    p.release = true
    p.release_date = DateTime.now
    p.save
  end
  posts << post
end

# Create sample tags
(1..10).each do |i|
  tag = Tagging.new post: posts.sample, tag: tags.sample
  tag.save
end

comment1 = Comment.new name: 'Maikel', email: 'mkdika@gmail.com', content: 'Good posting!', post: posts.first
comment1.save
