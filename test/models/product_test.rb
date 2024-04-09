require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "calculates average rating" do
    product = Product.create!(name: Faker::Food.dish)
    assert_equal 0, product.rating
    product.reviews.create!(author: Faker::Name.name, rating: 5)
    assert_equal 5, product.rating
    product.reviews.create!(author: Faker::Name.name, rating: 0)
    assert_equal 3, product.rating
    product.reviews.create!(author: Faker::Name.name, rating: 5)
    assert_equal 3, product.rating
    product.reviews.create!(author: Faker::Name.name, rating: 5)
    assert_equal 4, product.rating
  end
end
