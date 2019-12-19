# rBlog

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](/LICENSE)
[![rails badge](https://img.shields.io/badge/rails-5.2.3-brightgreen)](https://weblog.rubyonrails.org/2019/3/28/Rails-5-2-3-has-been-released/)
[![codebeat badge](https://codebeat.co/badges/f8f21f7f-6d58-42bf-a229-2e222f5b0e53)](https://codebeat.co/projects/github-com-mkdika-rblog-master)
[![codecov](https://codecov.io/gh/mkdika/rblog/branch/master/graph/badge.svg)](https://codecov.io/gh/mkdika/rblog)
[![Build Status](https://travis-ci.com/mkdika/rblog.svg?branch=master)](https://travis-ci.com/mkdika/rblog)
[![Known Vulnerabilities](https://snyk.io/test/github/mkdika/rblog/badge.svg?targetFile=package.json)](https://snyk.io/test/github/mkdika/rblog?targetFile=package.json)

Yet another simple Ruby on Rails 5 (RoR) blog application.
This is my RoR full stack web development learning project & example, including its automatic CI/CD setup and cloud platform deployment.

## Screenshots

### Front page
![Imgur](https://i.imgur.com/Wp8uefN.png)

### Admin page
![Imgur](https://i.imgur.com/uB99cya.png)

## This project use

- [Ruby 2.6.5](https://www.ruby-lang.org/en/)
- [Ruby on Rails 5.2.3](https://rubyonrails.org/), web framework.
- [Slim Templating 4](http://slim-lang.com/), HTML templating engine.
- [Devise](https://github.com/plataformatec/devise), flexible authentication solution.
- [Ruby Recaptcha](https://github.com/ambethia/recaptcha), recaptcha lib.
- [Paper Trail](https://github.com/paper-trail-gem/paper_trail), Track changes to your rails models.
- [RSpec Rails 3](https://relishapp.com/rspec/rspec-rails/v/3-9/docs), BDD and test suite.
- [Faker](https://github.com/faker-ruby/faker), A library for generating fake data such as names, addresses, and phone numbers.
- [Factory Bot Rails](https://github.com/thoughtbot/factory_bot_rails), a library for setting up Ruby objects as test data.
- [Capybara](https://github.com/teamcapybara/capybara), acceptance test framework for web applications.
- [Selenium](https://github.com/SeleniumHQ/selenium), a browser automation framework and ecosystem.
- [Bulma CSS](https://bulma.io/), mobile first CSS framework.
- [Postgresql 10](https://www.postgresql.org/)
- [Peru](https://github.com/buildinspace/peru), a package manager for including other people's code in your projects.
- [Vagrant](https://www.vagrantup.com), for development provisioning. Use [Ubuntu 18.04](http://releases.ubuntu.com/18.04/) based.
- [Ansible](https://www.ansible.com/), for automate and simply Vagrant provision.
- [Travis CI](https://travis-ci.org/), for CI & CD pipelines.
- [Heroku](https://www.heroku.com/), for cloud deployment platform, host this apps for free :smile:

## Blog Features

- Multi user login.
- Post blog, with category, tags, and comments.
- Multiple resolution responsive view.
- [Markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) as blog's content markup language.
- __Todo:__
  - [ ] Blog post archive page.
  - [ ] Setup email account for sending password recovery & instructions.
  - [ ] Dashboard to view blog post, number of comments, etc.

## Online Demo

- __Heroku__

  This is from automatic build (CI/CD). Plese visit [https://simple-rblog.herokuapp.com](https://simple-rblog.herokuapp.com)

  Demo account: 
  - email: `admin@example.com`
  - password: `admin`

## Running locally

### Environment & requirement provision

We need to have Ruby 2.6.5 or for ease the provisioning we can use Vagrant and this repository [vagrant-ruby-dev](https://github.com/mkdika/vagrant-ruby-dev).

### Environment variable

There are several env variable should be config prior running apps:

- `DATABASE_USERNAME`, database username.
- `DATABASE_PASSWORD`, database password.
- `DATABASE_HOST`, database host.
- `DATABASE_PORT`, database port.
- `DATABASE_URL`, database connection string url.
- `RECAPTCHA_SITE_KEY`, recaptcha site key, get it from [here](https://www.google.com/recaptcha/intro/v3.html).
- `RECAPTCHA_SECRET_KEY`, recaptcha secret key.

### Run Rails application

```bash
rails s
```

Or if you using and run inside Vagrant.

```bash
rails s -b 0.0.0.0
```

### Run all automatic testing

```bash
rspec
```

## Copyright and License

Copyright 2019 Maikel Chandika (mkdika@gmail.com). Code released under the MIT License. See [LICENSE](/LICENSE) file.
