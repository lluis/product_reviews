# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.destroy_all

# Create 10 random products
10.times do |i|
  name = Faker::Food.unique.dish
  Product.create(
    name: name,
    description: Faker::Lorem.paragraph,
    image_url: Faker::LoremFlickr.image(
      search_terms: name.split.select {|word| word.length > 3 }
    ),
  )
  # with 0-5 random reviews
  rand(5).times do
    Review.create(
      product: Product.last,
      text: Faker::Lorem.paragraph,
      rating: rand(5),
      author: Faker::Name.name,
    )
  end
end
