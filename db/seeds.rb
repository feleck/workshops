# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#require 'faker'

5.times do |i|
  User.create(email: "test#{i}@email.com",
              password: "pass1234!",
              password_confirmation: "pass1234!",
              firstname: Faker::Name.first_name,
              lastname: Faker::Name.last_name)
end

User.first.update_attribute(:admin, true)

Category.create(name: 'Toys')
Category.create(name: 'Books')

5.times do |i| # Count of products
  Product.create(title: "Book ##{i}", 
                  description: "#{i} product description",
                  price: rand(1..500),
                  category_id: rand(1..2), 
                  user_id: rand(1..5))
end

Product.create(
  title: 'ball',
  description: 'big beach ball',
  price: 4.53,
  category_id: 1,
  user_id: 2)

Product.create(
  title: 'Admin wand',
  description: 'Magic wand for admin!',
  price: 12.38,
  category_id: 1,
  user_id: 1)

15.times do |i| # Count of reviews
  Review.create(content: "Review number #{i} - content.", 
                rating: rand(1..5),
                product_id: rand(1..7),
                user_id: rand(1..5))
end

Review.create(content: "Other review content.", 
              rating: 4,
              product_id: 1,
              user_id: 3)
