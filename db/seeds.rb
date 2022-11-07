# This will delete any existing rows from the Product and User tables
# so you can run the seed file multiple times without having duplicate entries in your database
puts "Deleting old data..."
Product.destroy_all
User.destroy_all
Review.destroy_all

puts "Creating users..."
user1 = User.create(name: Faker::Name.name)
user2 = User.create(name: Faker::Name.name)
user3 = User.create(name: Faker::Name.name)
user4 = User.create(name: Faker::Name.name)


puts "Creating products..."
product1 = Product.create(name: "Stapler", price: 10)
product2 = Product.create(name: "Whiteboard", price: 15)
product3 = Product.create(name: "Dry Erase Markers", price: 5)
product4 = Product.create(name: "Ballpoint Pens", price: 2)
product5 = Product.create(name: "Scotch Tape", price: 3)

puts "Creating reviews..."
review1 = Review.create(star_rating: 8, comment: "Cool")
review2 = Review.create(star_rating: 9, comment: "Effective")
review3 = Review.create(star_rating: 6, comment: "Awesome")
review4 = Review.create(star_rating: 5, comment: "Average")
review5 = Review.create(star_rating: 4, comment: "Disappointing")
review6 = Review.create(star_rating: 10, comment: "Excellent")
review7 = Review.create(star_rating: 8, comment: "Great")

# *****************************************************************
# * TODO: create reviews! Remember, a review belongs to a product *
# * and a review belongs to an user.                              *
# *****************************************************************
# Create Reviews Here

# PRODUCT reviews
product1.reviews << review5
product1.reviews << review4

product2.reviews << review6
product2.reviews << review7

product3.reviews << review3

product4.reviews << review2

product5.reviews << review1

# USER reviews
user1.reviews << review4
user1.reviews << review6

user2.reviews << review5
user2.reviews << review3

user3.reviews << review2
user3.reviews << review1

user4.reviews << review7

puts "Seeding done!"