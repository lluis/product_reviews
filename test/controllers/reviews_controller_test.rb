require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @review = reviews(:one)
    @product = @review.product
  end

  test "should get new" do
    get new_product_review_url(@product)
    assert_response :success
  end

  test "should create review" do
    assert_difference("Review.count") do
      post product_reviews_url(@product), params: { review: { author: @review.author, product_id: @review.product_id, rating: @review.rating, text: @review.text } }
    end

    assert_redirected_to product_url(@product)
  end
end
