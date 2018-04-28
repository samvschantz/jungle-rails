class ReviewsController < ApplicationController

  def create
    product = Product.find(params[:product_id])
    review = product.reviews.new(
      user_id: current_user[:id],
      product_id: params[:product_id],
      description: params[:review][:description],
      rating: params[:review][:rating]
      )
    if review.save
      redirect_to product
    else
      redirect_to '/products'
    end
  end

  def destroy
    product = Product.find(params[:product_id])
    review = Review.find(params[:id])
    review.delete
    if review.delete
      redirect_to product
    else
      redirect_to '/products'
    end
  end

end