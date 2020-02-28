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
* Edit her/his own profile - should not be able to update email and password
* Admin accounts cannot be deleted.
* Create registered customer accounts (users).
* Create/view/edit/delete users.
* Create/view/edit/delete items.
* View the purchase history by items.
* View the purchase history by users.
* View return requests and approve/disapprove them. 
* Approve special item purchases.
* View feedback given by users and visitors.
* An admin should be capable of performing all operations performed by Visitor or Users. 

</details>

<details><summary>User</summary>
  
* The system should have user(s) who register themselves or are created by the admin.
* Log in with an email and password.
* Edit her/his own profile
* View items and sort (popularity, cost) / filter (category, brand, availability)
* Add items to cart.
* Add items to wishlist.
* If an item is currently unavailable, users should be able to subscribe to mailing alerts for when the item is available. (You need to actually implement a mailer that sends out email notifications for this)
* Clear cart.
* Buy an item immediately - this will directly take user to the payment page - bypassing the add-to-cart flow, a buy-now button. 
* Checkout cart
* Should receive an email listing the purchases made.
* Users below the age of 18 years should not be able to buy age-restricted items.
* Users of and above the age of 65 should get an automatic discount on all their purchases (10%).
* Give feedback via the feedback page.
* View history of purchases (should also be able to see returned items with a return status)
* Return an item (will require admin approval) - send out a mail when admin approves return. The history of purchases should reflect ‘Return Requested’ before admin approval and ‘Returned’ after admin approval. 

</details>

<details><summary>Visitor</summary>

* View items and sort (popularity, cost) / filter (category, brand, availability)
* Give feedback via feedback page
* Should see a button for registering with the system. Optionally, in place of the buy now button that registered users will see, a register to buy now button can be placed. 

</details>

<details><summary>Item</summary>

* Check-out/buy now payment
* Special Item approval
* Popularity of items

> The popularity of an item takes into account the average rating of that item and the number of purchases of that item. Each of the parameter is normalized and the normalized average rating has forty percent weightage whereas the number of purchases has sixty percent. 
It is formulated as below-
```
popularity = 0.4 * (normalized_average_rating) + 0.6 * (normalized_number_of_purchases)
```
* Subscribe for availability

</details>

<details><summary>Extra Credit</summary>

* No user/visitor should access any private content associated with other user/admin's account.
```
If you are logged in as a non-admin user and try to access /users_admin, you will not be allowed to.
```

* All users can use their Facebook account to log into the system. (But they need to edit their profile to provide all the required details by our system)

</details>

## Note

* No mapping of feedback with users
* Sorting and filtering are not cohesive right now (works independently)
* Admin can’t edit user’s password

