# Mario's Specialty Foods

#### An example site for a specialty foods store

#### By Mike Wright

## Technologies Used

* Ruby 2.6.10
* 5.2.8
* rspec
* capybara
* pry
* Postgres
* psql
* faker
* devise
* HTML
* CSS


## A site for a prospective client named Mario who runs a specialty foods store. It includes user registration as well as admin privelages that allow an admin to add or delete products from the inventory. 

## Setup/Installation Requirements

* Clone this repo
* Run `postgres` in your terminal to start your sql server
* In a new terminal, navigate to the root directory of this repo and run `bundle install` to install all required gems.
* Run `rake db:create` to create development and test databases.
* Run `rake db:migrate` to build necessary tables for the database.
* Run `rake db:seed` to seed the database.
* To check all passing test specs, run `rspec` in the terminal, this will test all files in the 'spec' directory.
* Run `rails s` in the terminal from the root directory to start the server
* Open your browser and navigate to http://localhost:3000/
* Sign up to become a registered user to navigate the site.
* You will need to assign admin privelages in through psql in the terminal to access all CRUD functionality.
* You can now navigate the site

## How to set an admin for full use of site

* After you make a user on the site, run `rails c` to open the rails console
* In the console type `User.where(email: "[email_used_to_create_user_account]").update(admin: true)`
* That user will now have access to full CRUD functionality for everything but updating/deleting a review(we don't support dishonesty in regards to reviews)

## Known Bugs

* No known bugs at this time

## License 

MIT

## Copyright (c) 05-27-2022 Mike Wright
