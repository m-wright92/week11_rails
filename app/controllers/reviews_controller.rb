# frozen_string_literal: true

class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :authenticate_user!, except: %i[show new create] do
    redirect_to products_path unless current_user&.admin?
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = 'Review uploaded!'
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  def show
    @review = Review.find(params[:id])
    @product = Product.find(params[:project_id])
    render :show
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = 'Review Deleted'
    redirect_to products_path
  end

  private

  def review_params
    params.require(:review).permit(:author, :rating, :content_body, :product_id)
  end
end
