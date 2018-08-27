# Pokedex
This project aims to use all 7-RESTful routes with the mvc design pattern to create a web application using the Ruby library Sinatra.

A database is seeded through an .sql file. Anything added will be automatically updated onto the web application and the database.

---

### Requirement
* Implement 7-RESTful routes
* Use Sinatra library
* Implement static assets using Sinatra
* Style it to perfection

---

### How to start the web application
* Fork/clone this repository to a local machine.
* Once it's been forked/cloned, run   
> bundle

This is to ensure that all the required dependencies are installed and available to run the project.

---

### Postgres Database
* Make sure you have Prostgres installed onto the local machine
* Once it is installed, Run
>psql

* Now create a database called "Pokemon"
>CREATE DATABASE pokemon;

* To seed the database into your web application, run
>psql -d pokemon -f seed.sql

Details about 4 pokemon will be injected into the database.

---

### Rack

* By now, you should have everything ready, Run
>rackup

This will allowed you to interact with the web application interface.

Please enter  http://localhost:9292/pokemon into your browser.

---
## Happy browsing~
