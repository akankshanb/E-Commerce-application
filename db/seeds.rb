# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

Item.create!([{
                        name: "Mac Book Pro",
                        brand: "Apple",
                        category: "Electronics",
                        cost: 2999.0,
                        quantity: 10,
                        purchases: 0,
                        available: true,
                        special: false,
                        restricted: false,
                        age_restricted: false,
                        image: Rails.root.join("app/assets/images/6.8tDjEQ6.jpg").open,
                        user_id: user.id
                    },
              {}
             ])
