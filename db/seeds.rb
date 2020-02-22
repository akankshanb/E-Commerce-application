# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Item.create!([
                 {brand: "Strawberry Canyon LLC", name: "Saas Textbook", category: "Books", quantity: 30, cost: 26.25, purchases: 0, available: true, special: false, restricted: false, age_restricted: false, image: "./assets/images/saas_book.jpg", popularity: 0.0},
                 {brand: "Grandma cooks", name: "Naan", category: "Grocery", quantity: 10, cost: 2.1, purchases: 0, available: true, special: false, restricted: false, age_restricted: false, image: "./assets/images/Naan.jpg", popularity: 0.384},
                 {brand: "Apple", name: "Macbook", category: "Electronics", quantity: 10, cost: 2875.0, purchases: 0, available: true, special: false, restricted: false, age_restricted: false, image: "./assets/images/saas_book.jpg/Macbook.jpg", popularity: 0.0},
                 {brand: "Buy your Luck", name: "Silver Lucky Charm", category: "Jewellery", quantity: 20, cost: 10.5, purchases: 0, available: true, special: false, restricted: false, age_restricted: true, image: "./assets/images/saas_book.jpg/silver-lucky-charm.jpg", popularity: 0.0},
                 {brand: "Apple", name: "Iphone 11", category: "Electronics", quantity: 10, cost: 1150.0, purchases: 0, available: true, special: true, restricted: false, age_restricted: false, image: "./assets/images/saas_book.jpg/Apple_iPhone_11.png", popularity: 0.408},
                 {brand: "Mush Makers", name: "Blender 2.0", category: "Electronics", quantity: 0, cost: 31.5, purchases: 0, available: false, special: false, restricted: false, age_restricted: false, image: "./assets/images/saas_book.jpg/Blender.jfif", popularity: 0.0}
             ])
Review.create!([
                   {rating: 5, comment: "Amazing phone! I love it!", item_id: 3},
                   {rating: 2, comment: "Very fragile. Broke it thrice already! Iphone? More like an Icephone!", item_id: 3},
                   {rating: 4, comment: "I wanna give 10/5 but can't!", item_id: 3},
                   {rating: 1, comment: "Android Forever!!!", item_id: 3},
                   {rating: 5, comment: "Just like my grandma makes!", item_id: 4},
                   {rating: 3, comment: "I microwaved them. They are soggy now.", item_id: 4},
                   {rating: 2, comment: "Tastes like eating a towel- wet, rough and smelly.", item_id: 4},
                   {rating: 1, comment: "Grandpa rules!!!", item_id: 4},
                   {rating: 5, comment: "Grandma rocks!", item_id: 4},
                   {rating: 5, comment: "Amazing phone!", item_id: 3}
               ])
Subscribe.create!([
                      {item_id: 11, user_id: 1}
                  ])
