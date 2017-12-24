# README

Simple [Action Cable](https://github.com/rails/rails/tree/master/actioncable) demo app,
advanced version see [here](https://github.com/myprogrammingblog/notificator-rails5-example).
### Make directory
```
mkdir bell
cd bell
```
### Generate new Rails 5 app without Test and Bundle install
```
rails new bell . -T -B
```
### Gemfile
find and uncomment string for [Redis](https://redis.io/)
```
gem 'redis', '~> 3.0'
```
add [Slim](http://slim-lang.com/)
```
# Slim lang
gem 'slim-rails'
```
add [ES6](https://github.com/TannerRogalsky/sprockets-es6/) syntax
```
# ES6 syntax
gem 'sprockets', '>= 3.0.0'
gem 'sprockets-es6'
```

### Bundler
```
gem install bundler --no-ri --no-rdoc
bundler
```
### Git
```
git init
git add .
git ci -m init project
git remote add origin git@github.com:MyAccount/bell.git
git push -u origin master
```
### First run
for Vagrant binding to 0.0.0.0 address and port 3000
```
rails s -b0 -p3000
```
### Set time zone
add to /config/application.rb
```
...
module Bell
  class Application < Rails::Application
    config.time_zone = 'Moscow'
  end
end
```
### Home controller
```
rails g controller home
```
### Notifications model
```
rails g model notification ip:string count:integer
```
```
app/models/notification.rb
db/migrate/20171224150110_create_notifications.rb
```
### Routing
`config/routes.rb`

### Create layout
```
assets/images/icons/bell.svg
app/views/layouts/
```
### Update home controller
`app/controllers/home_controller.rb`

### Update assets
```
app/assets/javascripts/home.es6
app/assets/stylesheets/home.scss
```
### Create View
```
app/views/home/_bell.html.slim
app/views/home/index.html.slim
```
### Action cable
add route
```
mount ActionCable.server => '/ws'
```
add url '/ws' to cable.js
```
app/assets/javascripts/cable.js
```
add action_cable_meta_tag to page header
```
app/views/layouts/_head.slim
```
add config for development and production environments
`config/environments/development.rb`

```
config.action_cable.url = 'ws://127.0.0.1:3000/ws'
config.action_cable.allowed_request_origins = ['http://0.0.0.0:3000', 'http://localhost:3000', 'http://127.0.0.1:3000']
# for any
# config.action_cable.disable_request_forgery_protection = true
```
add prefix for redis production
```
config/cable.yml
```
add notifications channel
```
app/channels/notifications_channel.rb
```
add to model Broadcast notification channel
```
app/models/notification.rb
```
add Subscription to notification channel
```
app/assets/javascripts/channels/notifications.es6
```
