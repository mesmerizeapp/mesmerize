# Mesmerize

## Installation

### Dependencies:

1. Install ImageMagick (`brew install imagemagick` or `sudo apt-get install imagemagick`)

### First-Time Setup:

1. Copy and modify the database.yml file: `cp config/database.yml.example config/database.yml`
2. Copy and modify the .env file: `cp .env.example .env`
3. Run `bundle install` to install all the gems
4. Run `rake db:setup` to create and seed the database
5. Run `foreman start` to run the server

### Additional instructions for Test-Driven Development:

1. Run `rake db:test:load`
2. Run `guard` in another terminal to re-run the tests as and when files are modified

### Handling updates:

1. Run `bundle install`
2. Run `rake db:migrate`
