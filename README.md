# README

# Rock Paper Scissors - Rails Backend

## Overview

This is the rails backend for a simple Rock Paper Scissors app. 

I used these docs for reference:

https://guides.rubyonrails.org/getting_started.html

Backend Repo: 

https://github.com/Jess-White/rock-paper-scissors-rails-backend

Frontend Repo:

https://github.com/Jess-White/rock-paper-scissors-react-frontend

The frontend is configured to run on http://localhost:3001
(To double-check or change, check the scripts in the package.json file: scripts: "start": "PORT=3001 react-scripts start")
The backend is configured to run on http://localhost:3000 (default) and accept requests from localhost:3001
(To double-check or change, check cors.rb: origins 'localhost:3001')

Routes:
This app uses resources to configure routes. 
You can learn more about resources here:
https://guides.rubyonrails.org/routing.html

This app includes:

resources :players

Which creates the following routes:

GET	/photos	photos#index

POST	/photos	photos#create	

GET	/photos/:id	photos#show	

PATCH/PUT	/photos/:id	photos#update

DELETE	/photos/:id	photos#destroy

This app also includes a seeds file with 5 players so you can get started.

## Developing

You will need the following installed:
* Ruby 2.6.5
* Rails 6.0.5
* PostgreSQL 10

## Installation

Run the following commands:

```bash
# Install dependencies
$ bundler install
# Set credentials. This will open up an editor that you can exit to continue.
$ rm config/credentials.yml.enc && rails credentials:edit
# Create, migrate, and seed database
$ rails db:create db:migrate db:seed
# Start server on port :3000
$ rails s
```

## Testing

* How to run the test suite:
This app includes rspec out of the box. 
# Runs the entire test suite
$ rspec
# Runs the tests for a given file
$ rspec [path to file]
# Runs a particular test
$ rspec [path to file:line number]

This app also includes guard-rspec.
You can read more about guard-rspec here:
https://github.com/guard/guard-rspec
I used this tutorial for reference:
https://www.lewisyoul.co.uk/posts/automate-your-rspec-test-suite-with-guard
# Generate guardfile with default spec configurations:
# (This should be done already, but just in case you're having problems after bundle install:)
$ bundle exec guard init rspec
# Starts guard, which will automatically watch and run the tests for any file *or* test file you update/save:
$ bundle exec guard
# You should see this in the terminal:
# 16:19:58 - INFO - Guard::RSpec is running