[![ruby-check](https://github.com/SaenkoJr/ftl-test-task/actions/workflows/ruby-check.yml/badge.svg)](https://github.com/SaenkoJr/ftl-test-task/actions/workflows/ruby-check.yml)

## FTL Test Task

[Demo](https://ftl-test-task.herokuapp.com)

P.s. i'm using free heroku dyno so it may take a while

### Required
* Ruby >= 3.0.1
* Node.js
* Yarn
* Sqlite3

### Development

#### Setup
```sh
make setup

or

bin/setup
bin/rails db:fixtures:load
```

#### Start app
```sh
make start

or

bin/rails server
```

#### Run linter
```sh
make lint

or

bundle exec rubocop
```

#### Run tests
```sh
make test

or

bin/rails test
```
