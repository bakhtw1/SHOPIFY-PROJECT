# Shopify Applcation Challenge

## Docker setup

This application was made using a docker container, to contain all dependencies and expedite the 
initial setup. The docker daemon can be started by using the following command:

```
docker-compose run --rm --service-ports ruby_dev
```

This will create a container which will automatically download/install the required tools and 
package managers.

## Server start


This application was written in Rails, so to start the server, change directories `cd image_repo` 
and run `bundle install` to install all the required packages and use the following command to start to server:

```
rails server -e development -p $PORT -b 0.0.0.0
```

This will run the server at `localhost:3000`

## About the app

This application acts as a store, where you can create an account and buy images from the store 
and have them added to your account. The store can also be updated and images can be added to it.

### Implemented features:

* User
  * Users were implemented using the `devise` gem, but the views and user model were extended to fit the context of this application 
  * By default devise checks for things like duplicate users, and has built in session management, so it was really delightful working with this gem
  * Devise also is really easily extendable so I was able to add fields and customize the controllers for it right away
* UserAccounts
  * UserAccounts have a *one-to-one* relationship with a user, and store information like wallet and etc..
* Store
  * The image store is basically just a bunch of images that are accessible from the asset pipeline, and each image is kept track of by the `store_item` table in the database
  * Each store item can be updated to change the price or quantity, but the image cannot be changed
  * New items can be added and images can be uploaded through the store
  * For now every user can edit the store, but in future versions of this app, only admin users can edit the store
* User Items
  * A user can have many images or store items so this model keeps track of which users have bought what and at what quantities
  * Each time an item is bought it checks if there is stock or the user has enough dough to make the purchase 

### Things I would like to add
If were to use this in production there are a few more things I would like to add: 
* Store editable only by admins
* Store items searchable using image classifications 
* Sharing images from one user to another

## Technology/Concepts Used
* Docker for dev environment
* Ruby on Rails
* CRUD

## References
* https://www.w3schools.com/howto/howto_css_image_grid_responsive.asp
* https://guides.rubyonrails.org/getting_started.html