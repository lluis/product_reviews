require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "calculates average rating" do
    product = Product.create
    assert_equal 0, product.rating
    product.reviews << Review.create(rating: 5)
    assert_equal 5, product.rating
    product.reviews << Review.create(rating: 0)
    assert_equal 3, product.rating
    product.reviews << Review.create(rating: 5)
    assert_equal 3, product.rating
    product.reviews << Review.create(rating: 5)
    assert_equal 4, product.rating
  end
end
