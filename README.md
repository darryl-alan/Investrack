# Investrack

A stock investment reference system, built for Jayacom Alpha Electronics, to keep track of employee investments.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

Install these gems

```
gem install rails
gem install bcrypt
gem install stock_quote
```

### Installing

Run bundle install

```
bundle install --without production
```

Setup database

```
rails db:migrate
```

Then start the server

```
rails server
```

## Running the tests

```
rails test
```

## Deployment

This was built to be run on Heroku.

```
heroku login
```

Follow the instructions to login, and then

```
heroku create
```

And then

```
git push heroku master
```

Finally to migrate the database run

```
heroku run rails db:migrate
```

## Built With

- [Ruby on Rails](https://rubyonrails.org/) - The web framework used
- [Bootstrap](https://getbootstrap.com/) - CSS framework

## License

This project is licensed under the MIT License
