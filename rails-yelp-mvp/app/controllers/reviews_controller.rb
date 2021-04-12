class ReviewsController < ApplicationController
  def new
    # we need @restaurant in our `simple_form_for`
    # @restaurant = Restaurant.find_by(params[:restaurant_id])
    # @review = Review.new
  end

  def create
    # we need `restaurant_id` to asssociate review with corresponding restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new(review_params)
    # association here below
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render 'restaurants/show'
    end
  end

  private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  # end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
