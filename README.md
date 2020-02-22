<p align="center">
  <img width="200" height="200" src="https://upload.wikimedia.org/wikipedia/commons/e/e1/North_Carolina_State_University_Athletic_logo.svg">
</p>

# Object-Oriented Design & Development Project 2

# Store Management System

## Contributors
* [Sujal](https://github.ncsu.edu/ssujal)(ssujal@ncsu.edu) <br>
* [Akanksha Bhattacharaya](https://github.ncsu.edu/anbhatta)(anbhatta@ncsu.edu) <br>
* [Venkata Santosh Pavan Pisapati](https://github.ncsu.edu/vpisapa)(vpisapa@ncsu.edu) <br>

## Deployment

Link to deployed app: (https://storemanagementsystem.herokuapp.com)

## Admin credentials:
```
Email: admin@gmail.com
Password: 123456
```

## Main Components: 

* Admin
* User (Registered Customer)
* Visitor
* Item

## Current Functionalities

<details><summary>Admin</summary>
  
* Log in with an email and password.
* Edit her/his own profile - should not be able to update email and password.
* Admin accounts cannot be deleted.
* Create registered customer accounts (users).
* Create/view/edit/delete users.
* Create/view/edit/delete items.
* View feedback given by users and visitors.
* An admin should be capable of performing all operations performed by Visitor or Users. 

</details>

<details><summary>User</summary>
  
* The system should have user(s) who register themselves or are created by the admin.
* Log in with an email and password.
* Edit her/his own profile
* View items and sort (popularity, cost) / filter (category, brand, availability)
* Add items to cart.
* If an item is currently unavailable, users should be able to subscribe to mailing alerts for when the item is available. (You need to actually implement a mailer that sends out email notifications for this)
* Clear cart.
* Checkout cart.

</details>

<details><summary>Visitor</summary>

* View items and sort (popularity, cost) / filter (category, brand, availability).
* Give feedback via feedback page.

</details>

<details><summary>Item</summary>

* Popularity of items

> The popularity of an item takes into account the average rating of that item and the number of purchases of that item. Each of the parameter is normalized and the normalized average rating has forty percent weightage whereas the number of purchases has sixty percent. 
It is formulated as below-
```
popularity = 0.4 * (normalized_average_rating) + 0.6 * (normalized_number_of_purchases)
```
* Subscribe for availability

</details>
