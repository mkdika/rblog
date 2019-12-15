User.create!(email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', display_name: 'Administrator')

categories = Category.create [{name: 'Ruby'}, {name: 'Java'}, {name: 'Kotlin'}]

tags = Tag.create [{name: 'tutorial'},{name: 'poc'},{name: 'back-end'}, {name: 'event'}] 

post1 = Post.new title: 'Basic Ruby Tutorial', content: "## Hello World example\r`puts 'Hello World'`", category: Category.first, user: User.first, release: true, release_date: DateTime.now
post1.save

post2 = Post.new title: 'Kotlin Conf 2019', content: "# Kotlinconf 2019\r>Copenhagen, Denmark", category: Category.last, user: User.first, release: true, release_date: DateTime.now
post2.save

tags1 = Tagging.create post: post1, tag: tags.first
tags2 = Tagging.create post: post1, tag: tags.last

tags3 = Tagging.create post: post2, tag: tags.last

comment1 = Comment.new name: 'Maikel', email: 'mkdika@gmail.com', content: 'Good posting!', post: post1
comment1.save
