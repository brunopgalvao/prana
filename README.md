# Prana

    $ git clone git@github.com:brunopgalvao/prana.git
    $ cd prana
    $ bundle install --without production
    $ bundle exec rake db:migrate
    $ bundle exec rake db:test:prepare
    $ bundle exec rspec spec/
    $ rails server

## In-the-box

We use [RSpec](https://github.com/rspec/rspec) and [Capybara](https://github.com/jnicklas/capybara) for testing
We use [Bootstrap](http://getbootstrap.com), an open-source web design framework from Twitter
We have our own custom authentication
We use [CanCan](https://github.com/ryanb/cancan) for authorization
