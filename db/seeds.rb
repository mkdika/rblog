user = User.create!(email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', display_name: 'Administrator')
categories = Category.create [{name: 'Ruby'},{name: 'Java'},{name: 'Kotlin'},
                              {name: 'Agile'},{name: 'Javascript'},{name: 'DevOps'},
                              {name: 'Golang'},{name: 'Rust'},{name: 'CloudPlatform'}]

tags = Tag.create [{name: 'tutorial'},{name: 'poc'},{name: 'back-end'}, {name: 'event'}, {name: 'front-end'}]

sample_post_content = <<DATA
## Lorem ipsum dolor sit amet consectetur adipiscing elit.

__Aenean sed consequat enim.__ Fusce vestibulum nunc ac quam convallis, eu aliquam libero facilisis. Morbi faucibus rhoncus nunc vitae efficitur. Aenean non massa quam. Vestibulum at posuere metus. Aenean ornare nisl in lorem volutpat ultricies. Nunc sed est pellentesque, convallis massa sit amet, egestas lectus. Fusce tempor sollicitudin est nec dapibus.

`Sed ante ex`, sagittis a auctor nec, imperdiet ut justo. Quisque cursus facilisis risus, ac dictum sapien semper ac. Aliquam erat volutpat. Nunc est augue, sodales sit amet blandit sed, luctus non nulla. Pellentesque at ultrices ligula, eu luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc eu nulla metus. Nullam sodales elit felis, consectetur auctor lacus mattis sit amet. Sed vehicula massa nunc, id rutrum quam porttitor a. Vivamus ante orci, hendrerit nec nulla et, rhoncus posuere nunc. Mauris ornare tempor mollis. Ut nunc tellus, feugiat vel finibus in, sollicitudin vel purus.

Fusce dictum vehicula diam, id faucibus leo porta quis. Fusce mattis erat nec maximus maximus. Suspendisse iaculis nulla leo, at auctor dui ullamcorper vestibulum. Integer sagittis ut lacus vitae blandit. Integer ultrices tincidunt libero ut auctor. Aenean faucibus aliquet nunc vitae interdum. Maecenas nec nisi non justo ultricies viverra sit amet ac erat. In porta aliquet nunc, vestibulum scelerisque elit cursus vitae.
DATA

# Create sample post
posts = []
(1..40).each do |i|
  post = Post.new.tap do |p|
    p.title = Faker::Book.unique.title
    p.content = sample_post_content
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
