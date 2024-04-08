json.extract! review, :id, :product_id, :rating, :text, :author, :created_at, :updated_at
json.url review_url(review, format: :json)
