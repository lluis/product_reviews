class ReviewsController < ApplicationController
  before_action :load_product

  # GET /reviews/new
  def new
    @review = @product.reviews.build
  end

  # POST /reviews or /reviews.json
  def create
    @review = @product.reviews.build(review_params)

    respond_to do |format|
      if @review.save
        format.turbo_stream
        format.html { redirect_to @product, notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        #TODO: Show validation errors with turbo_stream?
        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def load_product
      @product = Product.find(params[:product_id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:product_id, :rating, :text, :author)
    end
end
