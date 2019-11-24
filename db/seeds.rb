User.create!(email: 'admin@example.com', password: 'admin', password_confirmation: 'admin', display_name: 'Administrator')

categories = Category.create [{name: 'Ruby'}, {name: 'Java'}, {name: 'Kotlin'}]

tags = Tag.create [{name: 'tutorial'},{name: 'poc'},{name: 'back-end'}] 

post1 = Post.new title: 'Basic Ruby Tutorial', content: "## Hello World example\r`puts 'Hello World'`", category: Category.first, user: User.first
post1.save

tags1 = Tagging.create post: post1, tag: tags.first
tags2 = Tagging.create post: post1, tag: tags.last
