# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.
Live at: https://young-ravine-27027.herokuapp.com/
This was part of the exercises of the Lighthouse Labs Web development bootcamp.

## Contributions to this repo
1. Create login page
2. Create the sold-out badge when product expired
3. Implemented TDD with RSpec
4. Enforce being an admin to access admin pages
5. Creation of User model and validations
6. View/edit pages for Products/Categories
7. Implementation of products reviews 
8. Send an email when order is complete using ActionMailer
9. My Cart page shows custom message when cart is empty

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
