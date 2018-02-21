class ReviewsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    review = Review.create(review_params) # Created
    restaurant = Restaurant.find(params[:restaurant_id]) # Found rest
    review.restaurant = restaurant # assign it
    review.save # save
    redirect_to restaurant_path(restaurant) #redirect
  end

  private
  def review_params
    params.require(:review).permit(:content, :rating)
  end

end
