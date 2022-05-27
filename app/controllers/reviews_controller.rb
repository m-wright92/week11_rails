class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
    render :index
  end

  def new
    @review = Review.new
    render :new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to reviews_path
    else 
      render :new
    end
  end

  def show
    @products = Review.find(params[:id])
    render :show
  end

  private
    def review_params
      params.require(:review).permit(:author)
    end
end