# README

ToyRobot is a project to practice and hone my coding skills, especially focusing on TDD.

## To get started

* Checkout Repo
* Ensure you are using Ruby version (?????). Recommend using RVM for this.
* Run bundle install
* Run the following to create a database user (where localuser is a local account with sufficient priveleges to create a user with CREATEDB privilege:


      psql -U localuser -d postgres -a -f db/scripts/create_default_user_account.sql


* Run the following to create the databases (dev/test)

      rake db:create

* Run rake to run the build and tests

      rake