class ReviewsController < ApplicationController
  before_action :set_review, only: [:edit, :update, :destroy]
  def create
    @review = Review.new(review_params)
    @restaurant = Restaurant.find(params[:restaurant_id])

    @review.restaurant = @restaurant

    @review.save

    redirect_to @restaurant
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.restaurant
    else
      render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.restaurant
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
